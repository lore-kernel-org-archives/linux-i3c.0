Return-Path: <SRS0=k7kV=EK=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2820FC2D0A3
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Nov 2020 19:28:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86DDF205ED
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Nov 2020 19:28:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0Sl/kelU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="ZZ4iPSoI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="o+YUSEP9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86DDF205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y5GrAPIEwCjGOsd6xcxsqt/5BCq7SnUXrAjmUGSL298=; b=0Sl/kelUY1cDCwZBSABmKiqUE
	0AnXBUfGbAU3Wni6yEvpyZfxot7ElT1dBKhFGr94FEUglMdPOurrLk3hRnZFk9P+P8uoS9xYPnMfY
	ZotFLkprToJ5pPp/P269d1TuCwkfcaGL4H2KXW3ddYMHrZWRy9g4KR4O6VSZnXfchq+FlBDCcRl1r
	aqa2AdY5kSMbz2ATywZfzqoN9kUxGTKSkaw3cZFZpV0wRLrUfjFpR1TayGmErTbS2/ncjWWiIj4g+
	iCxdqOsAE7dWIzcy/SB+HK+SkZckBNT7gGlLFdHjEkFpNdv9AXMesMGdLKV7JtTUAf8PEwIgTsSQr
	0WyQMUDVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaOSL-0008LJ-Th; Wed, 04 Nov 2020 19:28:29 +0000
Received: from pb-smtp2.pobox.com ([64.147.108.71])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaOSJ-0008KX-BA
 for linux-i3c@lists.infradead.org; Wed, 04 Nov 2020 19:28:29 +0000
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 18CB9A2DAA;
 Wed,  4 Nov 2020 14:28:24 -0500 (EST)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=G+dk0mBlfkCULTNUZaRBFLqVdz4=; b=ZZ4iPS
 oIWsAm4utT8EGv4vgwBE0vIBH8xTWR11q/DF9j3WKgfzyGFjQc9gh8QIB2BjRJni
 BkFhrX+nQY4dWfLmuPJ8HpQTSrPgdeAEwCz3AKJj27JWI3q8bV1IYywOoaO6jSbC
 62ai295OBkwY7X6BkNjC59+NQD5LLUtatEUvs=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 0D041A2DA9;
 Wed,  4 Nov 2020 14:28:24 -0500 (EST)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=TNrDFyivsmri7uxFpYE9s+Jf/mb+dymkKvwe4ozyex0=;
 b=o+YUSEP9eVgNrVApMFASY1LNtDsROLdOnNB/PwKAboWUVwa1XVIuMwTMsMKxQaHfP47kCMrIiUXuhRQgs9VGs7oYRiVaEV3bUVIznAIN/xk3itfSmuQJfEZSQh16vubYjHLPGicB3YvhiaJtvc8fdat3DNqeJd/NhlMY5jgoTAs=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 66D10A2DA8;
 Wed,  4 Nov 2020 14:28:23 -0500 (EST)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id 4B1AE2DA0AC8;
 Wed,  4 Nov 2020 14:28:22 -0500 (EST)
Date: Wed, 4 Nov 2020 14:28:22 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: i3c: MIPI I3C Host Controller
 Interface
In-Reply-To: <20201104183459.GA3917393@bogus>
Message-ID: <nycvar.YSQ.7.78.906.2011041420420.2184@knanqh.ubzr>
References: <20201102222220.1785859-1-nico@fluxnic.net>
 <20201102222220.1785859-2-nico@fluxnic.net> <20201104183459.GA3917393@bogus>
MIME-Version: 1.0
X-Pobox-Relay-ID: E76BBFC2-1ED3-11EB-BEA4-74DE23BA3BAF-78420484!pb-smtp2.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_142827_417556_0EE57CD5 
X-CRM114-Status: GOOD (  21.28  )
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
Cc: devicetree@vger.kernel.org, Robert Gough <robert.gough@intel.com>,
 Laura Nixon <laura.nixon@team.mipi.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sakari Ailus <sakari.ailus@iki.fi>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthew Schnoor <matthew.schnoor@intel.com>, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, 4 Nov 2020, Rob Herring wrote:

> On Mon, Nov 02, 2020 at 05:22:19PM -0500, Nicolas Pitre wrote:
> > From: Nicolas Pitre <npitre@baylibre.com>
> > 
> > The MIPI I3C HCI (Host Controller Interface) specification defines
> > a common software driver interface to support compliant MIPI I3C
> > host controller hardware implementations from multiple vendors.
> > 
> > All that is needed is an I/O area and an interrupt signal;. The hardware
> > is self-advertising wrt its implementor and implemented capabilities so
> > there is currently no details that the driver can't figure out on its own.
> > 
> > Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> > ---
> >  .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 45 +++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> 
> With additionalProperties added,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks. Fixed patch below.

----- >8
From: Nicolas Pitre <npitre@baylibre.com>
Subject: [PATCH] dt-bindings: i3c: MIPI I3C Host Controller Interface

The MIPI I3C HCI (Host Controller Interface) specification defines
a common software driver interface to support compliant MIPI I3C
host controller hardware implementations from multiple vendors.

All that is needed is an I/O area and an interrupt signal;. The hardware
is self-advertising wrt its implementor and implemented capabilities so
there is currently no details that the driver can't figure out on its own.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>

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
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
