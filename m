Return-Path: <SRS0=RTqP=BY=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6618CC433E3
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Aug 2020 03:49:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 366F420716
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Aug 2020 03:49:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kbSssu5E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="aRFVRFxn";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="PHE3F7O6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 366F420716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WlHXtySq+s+8mkNg/IbZX0zVMnpVYZSKi6hSA5cse+o=; b=kbSssu5EKmhSa0m8ir2NdtGe8
	RNMGI6RCArmmO2z6kr+SrPEXVv1ZZWjnqt7sQjFGdVat3CcEL4PNwc1nhzunMmBkO0Y8IOopbQjOe
	K0Csx8qzIo6ETH5iUac/US2voSGzRr8JJNaYpJNSWe7qN/VgXAjjSG7IL4HsLmEsdjit4QyI/y2vv
	q4PhxreJVlxU4p9YKklbpwB6RelBMr4ensf3rBE9gi/EET3AGsza/43JpL7hgHYVwWi4yITduen/C
	2poHXh01bRCPJyXZSdjirb79Wc27RW9lxWZPGEdw54lBOboWYmgnUpZwySJ4zIRp8DAW2OnFSPSU/
	UNWM9C/qg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6Qic-0000cu-FI
	for linux-i3c@archiver.kernel.org; Fri, 14 Aug 2020 03:49:26 +0000
Received: from pb-smtp2.pobox.com ([64.147.108.71])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6QiZ-0000bY-9r
 for linux-i3c@lists.infradead.org; Fri, 14 Aug 2020 03:49:25 +0000
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id E83147DE7C;
 Thu, 13 Aug 2020 23:49:17 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
 :subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding; s=sasl; bh=HLZqWAG94rdap3KJwLywc33sS
 Lg=; b=aRFVRFxnRD7VO2wfYRShmzulepTY2lnhXb1A0GRYxYQlQVVQIcNn4UnL7
 gGQ0lmP2Jxg6iRBcyXwCYc8+pLFp23D1yTbBN5cLilQ2xEvKK++KtN6F8p1F2hPU
 nvs/9ycSIK67HVsvT9dRVuww2VJZp8axRbEny7EN9U+Jizl7Bo=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id E0A9C7DE7A;
 Thu, 13 Aug 2020 23:49:17 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-transfer-encoding;
 s=2016-12.pbsmtp; bh=nWa5DOGJXdfGY07BW0uH03Jmqn1R9rcKDPqYKkt3aj4=;
 b=PHE3F7O6+WjWL7sovkJyvxs0qxh14GDOkZ+cDcele20X6IZQwAQaWdW3KWpe/CBPC6oLIylXFK4/qjtGrNyq6Qyzwm3O0lpA4niTDxXHLfvAwRhywg/D3rNv/r7zvvwiHVtNYaALrsgme5peWqqpOJJutV7mBnzUMwgUdL0odFU=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 634357DE76;
 Thu, 13 Aug 2020 23:49:17 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTP id 7A3102DA0E8C;
 Thu, 13 Aug 2020 23:49:16 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: i3c: MIPI I3C Host Controller Interface
Date: Thu, 13 Aug 2020 23:48:53 -0400
Message-Id: <20200814034854.460830-2-nico@fluxnic.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200814034854.460830-1-nico@fluxnic.net>
References: <20200814034854.460830-1-nico@fluxnic.net>
MIME-Version: 1.0
X-Pobox-Relay-ID: 20B3B6F6-DDE1-11EA-A4B8-2F5D23BA3BAF-78420484!pb-smtp2.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_234923_388503_AFF458AF 
X-CRM114-Status: GOOD (  13.39  )
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
Cc: Laura Nixon <laura.nixon@team.mipi.org>,
 Robert Gough <robert.gough@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Matthew Schnoor <matthew.schnoor@intel.com>,
 Nicolas Pitre <npitre@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Nicolas Pitre <npitre@baylibre.com>

The MIPI I3C HCI (Host Controller Interface) specification defines
a common software driver interface to support compliant MIPI I3C
host controller hardware implementations from multiple vendors.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
---
 .../devicetree/bindings/i3c/mipi-i3c-hci.txt      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/mipi-i3c-hci.txt

diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.txt b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.txt
new file mode 100644
index 0000000000..8de7d7ac6a
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.txt
@@ -0,0 +1,15 @@
+MIPI I3C Host Controller Interface
+----------------------------------
+
+Required properties:
+- compatible : "mipi-i3c-hci"
+- reg : Should contain 1 register range (address and length)
+- interrupts : HCI interrupt
+
+Example:
+
+	mipi_i3c_hci@0xa0000000 {
+		compatible = "mipi-i3c-hci";
+		reg = <0xa0000000 0x2000>;
+		interrupts = <89>;
+	};
-- 
2.26.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
