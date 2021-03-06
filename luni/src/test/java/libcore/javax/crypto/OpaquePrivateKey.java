/*
 * Copyright (C) 2013 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package libcore.javax.crypto;

import java.security.PrivateKey;

/**
 * "Opaque" {@link PrivateKey} which does not provide structured access to the underlying key
 * material.
 */
public class OpaquePrivateKey extends OpaqueKey implements PrivateKey {

    /**
     * Constructs a new {@code OpaquePrivateKey} instance with the specified algorithm, encoded
     * form, and format of the encoded form.
     *
     * @param encoded encoded form or {@code null} if not supported.
     * @param format format of the encoded form (e.g., "PKCS#8"), or {@code null} if encoded form
     *        not supported.
     */
    public OpaquePrivateKey(String algorithm, byte[] encoded, String format) {
        super(algorithm, encoded, format);
    }
}
