Return-Path: <SRS0=t7CV=ER=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC25C5517A
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Nov 2020 22:05:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDED12087D
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Nov 2020 22:05:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KzAorIDj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="oP75mrCQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="zrZbVmq1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDED12087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AYAOJfzeQ8hiTeu3ElbovSjULLc1TlhYgphn/HTwbkM=; b=KzAorIDjIlHhpXs4cLcdg36vU
	8TeEJuTSXvSXngVOYmRtbk6kkIpGmIa2pUeuyIRJWGwjSdMTt8eKTPIZi+hpSmC2LtwZyQ5fA2Pke
	c8bQy2g9+oNkjtge1svUlWagyp9YWvEK9YNQzyIRZqRw9wsWihLI8kLDODabcGX4PNmKpEpefvKGp
	Pqoez8VEJABd+VoXPj0hlr5Jq+hYvaiiDcE/HkM1K+VfIIbSuVnomod0YcNz9O6uwJGZmFm3Beahv
	qU4JEv4q/N0HCGzk6oNT4gFRncH5O47b5/zmIfTOlyuobt/D30DxJVR6TR/Ew+ZRNmkncMQtswkC5
	hMa0Mr91g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcyF5-0005nZ-2q; Wed, 11 Nov 2020 22:05:27 +0000
Received: from pb-smtp21.pobox.com ([173.228.157.53])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcyF1-0005mK-PY
 for linux-i3c@lists.infradead.org; Wed, 11 Nov 2020 22:05:25 +0000
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 4CE99F16A6;
 Wed, 11 Nov 2020 17:05:21 -0500 (EST)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
 :subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding; s=sasl; bh=2I61uPz2OchyUx+lGY420JzMf
 mk=; b=oP75mrCQ4toeOqKAOtw4TOeEmuNZu+kkWo8xNj8U7uL74mNN6oEmql0Bm
 58LQHX/ajRLDVKqb6Uo77vgZ7VS9p88RxjNRNq+7Nf1jgi+yH7UvzWSgRUM9V9VP
 zqTw/Yao4PBNbslu586oiNxs6+u/DpXa8fZCcY8cVB++Qtijj0=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 437ADF16A5;
 Wed, 11 Nov 2020 17:05:21 -0500 (EST)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding;
 s=2016-12.pbsmtp; bh=aj8RtqyVFVyYpbuUPv1BivYDioRV3KL5mVzd7zpB6k0=;
 b=zrZbVmq1Nm62h1/URiAJ+ndQE8MzVZhEjghsm7RBQi8ggfmDqPTd/cDuWxQG4SCyixjO56GdDaNNxO7r/BimNIGJKJPoPWY7WJS/lvEtBly2UgnMgz6zILq0s0SnWq26SXAvjqB45OIQz2Y0E01oM9qD1STzrF5vwcx8iEapf9k=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id F0112F16A3;
 Wed, 11 Nov 2020 17:05:17 -0500 (EST)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTP id 3A8F02DA0CD6;
 Wed, 11 Nov 2020 17:05:16 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-i3c@lists.infradead.org
Subject: [PATCH v4 1/2] dt-bindings: i3c: MIPI I3C Host Controller Interface
Date: Wed, 11 Nov 2020 17:05:09 -0500
Message-Id: <20201111220510.3622216-2-nico@fluxnic.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201111220510.3622216-1-nico@fluxnic.net>
References: <20201111220510.3622216-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: FBD27032-2469-11EB-81FE-D609E328BF65-78420484!pb-smtp21.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_170523_981843_DD17AEF7 
X-CRM114-Status: GOOD (  14.82  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Laura Nixon <laura.nixon@team.mipi.org>, Rob Herring <robh+dt@kernel.org>,
 Robert Gough <robert.gough@intel.com>, Sakari Ailus <sakari.ailus@iki.fi>,
 Nicolas Pitre <npitre@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthew Schnoor <matthew.schnoor@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Nicolas Pitre <npitre@baylibre.com>

The MIPI I3C HCI (Host Controller Interface) specification defines
a common software driver interface to support compliant MIPI I3C
host controller hardware implementations from multiple vendors.

All that is needed is an I/O area and an interrupt signal;. The hardware
is self-advertising wrt its implementor and implemented capabilities so
there is currently no details that the driver can't figure out on its own.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml

diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
new file mode 100644
index 0000000000..07a7b10163
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/i3c/mipi-i3c-hci.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MIPI I3C HCI Device Tree Bindings
+
+maintainers:
+  - Nicolas Pitre <npitre@baylibre.com>
+
+description: |
+  MIPI I3C Host Controller Interface
+
+  The MIPI I3C HCI (Host Controller Interface) specification defines
+  a common software driver interface to support compliant MIPI I3C
+  host controller hardware implementations from multiple vendors.
+
+  The hardware is self-advertising for differences in implementation
+  capabilities, including the spec version it is based on, so there
+  isn't much to describe here (yet).
+
+  For details, please see:
+  https://www.mipi.org/specifications/i3c-hci
+
+properties:
+  compatible:
+    const: mipi-i3c-hci
+  reg:
+    maxItems: 1
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    i3c@a0000000 {
+      compatible = "mipi-i3c-hci";
+      reg = <0xa0000000 0x2000>;
+      interrupts = <89>;
+    };
-- 
2.26.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
