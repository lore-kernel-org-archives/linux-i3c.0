Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F63CD5BD0
	for <linux-i3c@archiver.kernel.org>; Mon, 25 May 2026 12:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZIX0iXOHtbVm6YZD15+9WNsnNDantc3M+GNxn2aaqVY=; b=CMup1cbwV6HOLA
	f+C8as1OpLu7DrPXJ+Mhpyng2F0D2OPlKlU4vM15BjRB31BUc1drLXDuR53gFXysc7f2K3Z9X9bq9
	BghPI8T9cbQ81f8Ix85gVbM7/j6Gn9VwNTDIm0ECyZDWr9Gl66gtNENOm54Zgua0apm6OSP39dq7a
	Cn+ze3JBtFTbbtNDmHQ7EcFDt1Cr+bdV6zm+gU4F7ilRuJtYsEr5kkH1HyJqKDieiZfkaZuRHtGIc
	66DQ1DiUwl4PavN5LF296Q/NkqhXs00sS8gD0+3G47JVjVnHgdM31Jwz7t4wNpOjKx3rBJcybGftt
	2pU5X9srxKCmNBDjaRLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUn9-0000000HEZ8-1JAv;
	Mon, 25 May 2026 12:52:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUn7-0000000HEYt-3Dhr
	for linux-i3c@bombadil.infradead.org;
	Mon, 25 May 2026 12:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=HhuAfq0KrjWR2hOdUgLXv8apqAQKmXIb959Lev66uvE=; b=K+jlC99o/cU5gbk8/FJ6NzK92A
	2ePQYCMfrGUx3UFHoQlVvsW/p4AgISQ6CCqcHMHOn8/xVZR+Fnjw/hyPCC55OBu2PF5T/k+q//lqE
	xYDb/hO98a3X+J+2n2oAK+6L800pLEtbfepYX9SIVW/81QaYjag5aKGWax0Fud/lsU3roxMJu2jVV
	z9r5dAlYDBt5K/UC9vRbwQ+BuK0mhEXhQd/aapXHajKLH57e7Cv0BrZPVvwh7P9xc+Y5cSRMmiEVp
	CIvn89thPp2c9lTcFpAOJAtGag5ok92QknSWypL1dadn4lvGU03Ckuw/RLp+40S5BcqvmQy7K064p
	FGVbKRCA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUn3-00000009ERK-0DiI
	for linux-i3c@lists.infradead.org;
	Mon, 25 May 2026 12:52:20 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64PCpesuF1058787, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1779713501;
	bh=HhuAfq0KrjWR2hOdUgLXv8apqAQKmXIb959Lev66uvE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=pyht0Q78EiaIC6iJIjqw82xk6qOYzBBQYM1XQgHw4FnU3QBcLkHQGXM4hXj3Rx63s
	 IINYyHVdMcJNimOgpi3to4fXBSum/VRH93zi9EtpnYNYJBF40jPMvbiweQ0rZ4Eo/w
	 QBZfkrbY3wWeiflA+lM0Ers2RKoP7CJVFsykn+1uFZR9WRXd595i3k3lZo3SUbxGFU
	 +KwzzS4eJBY6CjR3+V6cfLALLRribH1ZM1DkZL0QwGV8OCtlZz3fkONBqJ68dLjs1k
	 o1HiD2Q/qcGxZSHcHLNOo7jjVUMXox/lDShLWF/EWPoCqGPRwAEJHAPXfgziUj0dui
	 0ZcCgbLVRM9Ng==
Received: from RS-EX-MBS2.realsil.com.cn ([172.29.17.102])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 64PCpesuF1058787
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 May 2026 20:51:41 +0800
Received: from A106071510.realsil.com.cn (172.29.42.211) by
 RS-EX-MBS2.realsil.com.cn (172.29.17.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 May 2026 20:51:40 +0800
From: <zain_zhou@realsil.com.cn>
To: <linux-staging@lists.linux.dev>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <alexandre.belloni@bootlin.com>,
	<Frank.Li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linusw@kernel.org>, <brgl@kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<wei_wang@realsil.com.cn>, Yin Zhou <zain_zhou@realsil.com.cn>
Subject: [PATCH v2 1/2] dt-bindings: i3c: add Realtek RTS490x I3C HUB
Date: Mon, 25 May 2026 20:51:27 +0800
Message-ID: <20260525125128.297-1-zain_zhou@realsil.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [172.29.42.211]
X-ClientProxiedBy: RS-EX-MBS1.realsil.com.cn (172.29.17.101) To
 RS-EX-MBS2.realsil.com.cn (172.29.17.102)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_135218_261216_35723E9D 
X-CRM114-Status: GOOD (  16.07  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Yin Zhou <zain_zhou@realsil.com.cn>

Add DT binding schema for Realtek RTS490x series I3C HUB devices.

The binding describes configuration properties for:
  - LDO enable/disable and voltage level per port group
  - Pull-up resistance per port group
  - IO driver strength per port
  - Per target-port mode (I3C/SMBus/GPIO/disabled), pull-up,
    IO mode, SMBus clock frequency and polling interval
  - Hub network always-I3C mode
  - Hardware identification via CSEL pin (id) and CP1 pins (id-cp1)

Signed-off-by: Yin Zhou <zain_zhou@realsil.com.cn>

Changes in v2:
- Rework binding per Krzysztof Kozlowski's review:
  add realtek, vendor prefix to all custom properties; use boolean
  for enable flags; use u32 with unit suffixes (-microvolt, -ohms)
  for voltage/resistance; change to unevaluatedProperties: false;
  fix title, maintainer name, description, $nodename pattern
- Consolidate examples; add dt-bindings/i2c/i2c.h include
---
 .../bindings/i3c/realtek,rts490x-i3c-hub.yaml | 263 ++++++++++++++++++
 1 file changed, 263 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml

diff --git a/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml b/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
new file mode 100644
index 000000000000..851a433abcd3
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
@@ -0,0 +1,263 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/realtek,rts490x-i3c-hub.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTS490x I3C HUB
+
+maintainers:
+  - Yin Zhou <zain_zhou@realsil.com.cn>
+
+description:
+  The Realtek RTS490x is an I3C HUB device that provides voltage level
+  translation between I3C controller and target devices, bus capacitance
+  isolation, address conflict isolation, I3C port expansion (up to 8
+  target ports), simultaneous dual-controller port support, and per-port
+  mode selection (I3C, SMBus, GPIO, or disabled).
+
+properties:
+  $nodename:
+    pattern: "^hub@[0-9a-f]+(,[0-9a-f]+)*$"
+
+  compatible:
+    const: realtek,rts490x-i3c-hub
+
+  reg:
+    maxItems: 1
+    description:
+      Encodes the static I2C address, manufacturer ID, and part/instance ID
+      as defined by the I3C specification.
+
+  assigned-address:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x1
+    maximum: 0xff
+    description:
+      Dynamic I3C address to assign to this device.
+
+  dcr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Device Characteristic Register value of the hub.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  realtek,cp0-ldo-enable:
+    type: boolean
+    description:
+      Enable the on-die LDO for Controller Port 0.
+
+  realtek,cp1-ldo-enable:
+    type: boolean
+    description:
+      Enable the on-die LDO for Controller Port 1.
+
+  realtek,tp0145-ldo-enable:
+    type: boolean
+    description:
+      Enable the on-die LDO for Target Ports 0/1/4/5.
+
+  realtek,tp2367-ldo-enable:
+    type: boolean
+    description:
+      Enable the on-die LDO for Target Ports 2/3/6/7.
+
+  realtek,cp0-ldo-microvolt:
+    enum: [1000000, 1100000, 1200000, 1800000]
+    description:
+      Output voltage of the Controller Port 0 on-die LDO, in microvolts.
+
+  realtek,cp1-ldo-microvolt:
+    enum: [1000000, 1100000, 1200000, 1800000]
+    description:
+      Output voltage of the Controller Port 1 on-die LDO, in microvolts.
+
+  realtek,tp0145-ldo-microvolt:
+    enum: [1000000, 1100000, 1200000, 1800000]
+    description:
+      Output voltage of the Target Ports 0/1/4/5 on-die LDO, in
+      microvolts.
+
+  realtek,tp2367-ldo-microvolt:
+    enum: [1000000, 1100000, 1200000, 1800000]
+    description:
+      Output voltage of the Target Ports 2/3/6/7 on-die LDO, in
+      microvolts.
+
+  realtek,tp0145-pullup-ohms:
+    enum: [0, 250, 500, 1000, 2000]
+    description:
+      Pull-up resistance for Target Ports 0/1/4/5, in ohms. 0 disables
+      the pull-up.
+
+  realtek,tp2367-pullup-ohms:
+    enum: [0, 250, 500, 1000, 2000]
+    description:
+      Pull-up resistance for Target Ports 2/3/6/7, in ohms. 0 disables
+      the pull-up.
+
+  realtek,cp0-io-strength-ohms:
+    enum: [20, 30, 40, 50]
+    description:
+      Output driver impedance for Controller Port 0, in ohms.
+
+  realtek,cp1-io-strength-ohms:
+    enum: [20, 30, 40, 50]
+    description:
+      Output driver impedance for Controller Port 1, in ohms.
+
+  realtek,tp0145-io-strength-ohms:
+    enum: [20, 30, 40, 50]
+    description:
+      Output driver impedance for Target Ports 0/1/4/5, in ohms.
+
+  realtek,tp2367-io-strength-ohms:
+    enum: [20, 30, 40, 50]
+    description:
+      Output driver impedance for Target Ports 2/3/6/7, in ohms.
+
+  realtek,id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 3]
+    description: |
+      I3C HUB hardware ID based on CSEL pin state. Values:
+        0 - CP0 is selected as primary Controller Port
+        1 - Primary Controller Port selected by software
+        3 - CP1 is selected as primary Controller Port
+
+  realtek,id-cp1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+    description:
+      I3C HUB hardware ID based on CP1 SDA and SCL pin state probed
+      during power-on.
+
+patternProperties:
+  "^target-port@[0-9]+$":
+    type: object
+    description:
+      I3C HUB target port child node, named target-port@<id>.
+
+    properties:
+      compatible:
+        const: realtek,rts490x-i3c-hub-port
+
+      reg:
+        maxItems: 1
+        description:
+          Target port index (0-based).
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      realtek,mode:
+        enum: [disabled, i3c, smbus, gpio]
+        description:
+          Operating mode of this target port.
+
+      realtek,pullup-enable:
+        type: boolean
+        description:
+          When present, enables the pull-up for this target port.
+
+      realtek,always-enable:
+        type: boolean
+        description:
+          When present, the target port is always enabled. Otherwise
+          the port is enabled on demand and disabled after use.
+
+      realtek,polling-interval-ms:
+        minimum: 0
+        description:
+          SMBus polling interval in milliseconds. If absent or 0,
+          polling is disabled and IBI is used instead.
+
+      clock-frequency:
+        enum: [100000, 200000, 400000, 1000000]
+        description:
+          SMBus clock frequency in Hz. Applies only when mode is smbus.
+          Defaults to 400000 if absent.
+
+    additionalProperties: true
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/i2c/i2c.h>
+    i3c-master@d040000 {
+      reg = <0xd040000 0x1000>;
+      #address-cells = <3>;
+      #size-cells = <0>;
+
+      hub@70,4ba00000000 {
+        compatible = "realtek,rts490x-i3c-hub";
+        reg = <0x70 0x4ba 0x00000000>;
+        assigned-address = <0x70>;
+        dcr = <0xc2>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        realtek,cp0-ldo-enable;
+        realtek,cp1-ldo-enable;
+        realtek,cp0-ldo-microvolt = <1000000>;
+        realtek,cp1-ldo-microvolt = <1100000>;
+        realtek,tp0145-ldo-enable;
+        realtek,tp0145-ldo-microvolt = <1200000>;
+        realtek,tp2367-ldo-microvolt = <1800000>;
+        realtek,tp0145-pullup-ohms = <2000>;
+        realtek,tp2367-pullup-ohms = <500>;
+        realtek,tp0145-io-strength-ohms = <50>;
+        realtek,tp2367-io-strength-ohms = <30>;
+        realtek,cp0-io-strength-ohms = <20>;
+        realtek,cp1-io-strength-ohms = <40>;
+
+        target-port@0 {
+          compatible = "realtek,rts490x-i3c-hub-port";
+          reg = <0>;
+          realtek,mode = "i3c";
+          realtek,pullup-enable;
+          realtek,always-enable;
+        };
+
+        target-port@1 {
+          compatible = "realtek,rts490x-i3c-hub-port";
+          reg = <1>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+          realtek,mode = "smbus";
+          realtek,pullup-enable;
+          clock-frequency = <1000000>;
+          realtek,polling-interval-ms = <10>;
+
+          i2c@10 {
+            compatible = "i2c-slave-mqueue";
+            reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+          };
+        };
+
+        target-port@2 {
+          compatible = "realtek,rts490x-i3c-hub-port";
+          reg = <2>;
+          realtek,mode = "gpio";
+        };
+
+        target-port@3 {
+          compatible = "realtek,rts490x-i3c-hub-port";
+          reg = <3>;
+          realtek,mode = "disabled";
+        };
+      };
+    };
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
