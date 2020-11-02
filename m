Return-Path: <SRS0=wWa5=EI=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8413BC00A89
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Nov 2020 22:22:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6B6920786
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Nov 2020 22:22:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qgm2qiOZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="TpPz958A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="i3KpBgUf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6B6920786
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z2rmB2GhsOTBIDEIgLVwrMcgMjmFG3e0NivBFieq+bA=; b=qgm2qiOZciDUZb306gykYnfTT
	sAjBbmejRJD4qqbJHcuAQYcLxIcFUws5dM3czu/bFmZIjWyz3QyV8S30BxEANmkgsst+OSstze6cJ
	4yvRQhAc0appRSYTd3thtNxkuQiXABVesn5fATXOR4x0Vao2d3MJAHBLjIeU70OfXm4yccHRuPf3M
	Fz7MRRRCEZK/O5FOQudQ6vCA7BtkY5/lDndFMzug0bg2DILhOhkgf7shsPSWNyHP2vJBdQV0otRD0
	VNeSjjriTmMzs9tXRUoBssABSzWrCl6XZlzDeNUOx5cIFMAsbP/reXWR5lSkEy9cPrvw2kXIyzUYw
	/EUSHtLxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZiDn-0000Wt-0Y; Mon, 02 Nov 2020 22:22:39 +0000
Received: from pb-smtp1.pobox.com ([64.147.108.70])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZiDh-0000Uj-2d
 for linux-i3c@lists.infradead.org; Mon, 02 Nov 2020 22:22:35 +0000
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id E22BEA1F46;
 Mon,  2 Nov 2020 17:22:27 -0500 (EST)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
 :subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding; s=sasl; bh=aX23A/a1IXG9GPuYRICeb7KJo
 6c=; b=TpPz958A8PWho9OJ+1NLEaed5EJWEmNfb/t9szq1QuIYZWVq6fJG3naP/
 AAKhRRvSiSyH4p0+6wkVzvqHUcYll+Yf4UEkbmLq2Ia9xlA81JWC7LkDqIlMsha2
 1N+Uq17yw4MvZpwVeZIUfXKNxFIB8ClsdkMqEOjuSzZBq81JCQ=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id D7D10A1F45;
 Mon,  2 Nov 2020 17:22:27 -0500 (EST)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding;
 s=2016-12.pbsmtp; bh=qbILXtyDACKPCCluEviBgtfJc3MEAco2Njdj8A1dt80=;
 b=i3KpBgUfcD3U6/egrRqI816ufFr3nVi8Qbkir1kJte+TrcMWqV3unjxUQtpFoHgWC18CPR44txQ3gPfmBwqE31J5TtNBR89awm0A3mvtC08GOV8pvI6kBPXxbOPKJXimoo/9b5xhZMojLlG1o4yZ534WEckzSfl3HzSmITWuCcA=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 5FA69A1F44;
 Mon,  2 Nov 2020 17:22:27 -0500 (EST)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTP id 8FCDF2DA0C8B;
 Mon,  2 Nov 2020 17:22:26 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: i3c: MIPI I3C Host Controller Interface
Date: Mon,  2 Nov 2020 17:22:19 -0500
Message-Id: <20201102222220.1785859-2-nico@fluxnic.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201102222220.1785859-1-nico@fluxnic.net>
References: <20201102222220.1785859-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: E3AF80E2-1D59-11EB-B8B9-D152C8D8090B-78420484!pb-smtp1.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_172233_215893_B2541C4D 
X-CRM114-Status: GOOD (  15.59  )
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
---
 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml

diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
new file mode 100644
index 0000000000..1ceb165252
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
@@ -0,0 +1,45 @@
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
