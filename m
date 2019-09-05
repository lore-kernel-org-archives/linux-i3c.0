Return-Path: <SRS0=amWc=XA=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B04C3A5AE
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Sep 2019 10:00:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A0AE2184B
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Sep 2019 10:00:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HBnHTO1D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MZ1vo3sW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A0AE2184B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jAUnN9kFh7D1uq8JOF/nd5RUL+ZWIauQKiSzbVc5r/s=; b=HBnHTO1D7Dez85iYV7LEjj1uhK
	QdxeKBrOZB37evWcCsUFm33dY6K/JRwnZC1+5VRZmM4fYg14uAgwd383SIGapj1zbl/q4HP50SjJq
	+EXKUfBil6T+BlXFmByrvcSc/FaYKCPp6E9QBxvYLBjY3sS7q2oIdgiFGGs0gUzOV4vT66AXzVG0U
	fIMAGmo1DJOTlckWTYEgguvYTpLgDmzN/ki3T5eYNBiW5TmP0WC68vHZqX6Mhn+mDY41G2an9XgqV
	kTKlxhahZvWVIrVDC03T4Z0nfVnJpv8ebALJR6Ns+ZC20+rzznwYa1Wud1fZ4iBCHMNY2wTfy07A9
	SCagB6aw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5oZW-0007gO-UR; Thu, 05 Sep 2019 10:00:58 +0000
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5oZU-0007eT-1R
 for linux-i3c@lists.infradead.org; Thu, 05 Sep 2019 10:00:57 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BF8C2C29BA;
 Thu,  5 Sep 2019 10:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1567677655; bh=Hd5e4FWS+UlKygYV+pJ0TjvOiFk6XNsxRtjAc94qTX0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=MZ1vo3sW/wPI1OpakmeAaAyM1I+pluxXz3hhJQbYXfulxarKlaj22QhFcxdnjT4dx
 /gSE7pjEMvVYjS8tUNFYXo17mky0HGrUfJYDW56DOI6d73xKo0ysQncTiM956GM9HF
 8UEjFWzj6oSeYMBfs/YsQ5PP28tTJgBRaHtlObIUoChH6AIbCT+zWwHZYLAiSI16AR
 mQ+5XhsLo3LBZWS/AoYpfojf07xrmPIt4WEVFL2uXdpIPlrU4w6mhuzMWWXGY2n9KT
 fTBsC3fyRHkOgkcSn2AsQE5SobNVDe0X/tgJ2zTC0vhb0Y6zqBI8rkhwITi5lmOSg7
 vOTJzA4djQVeQ==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 8BF84A0064;
 Thu,  5 Sep 2019 10:00:49 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 6EB513F3B9;
 Thu,  5 Sep 2019 12:00:49 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i3c@lists.infradead.org
Subject: [PATCH v3 3/5] dt-bindings: i3c: Make 'assigned-address' valid if
 static address == 0
Date: Thu,  5 Sep 2019 12:00:36 +0200
Message-Id: <35e317ef6c9c0c729f713e57a55a2cd8bd55899b.1567608245.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567608245.git.vitor.soares@synopsys.com>
References: <cover.1567608245.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1567608245.git.vitor.soares@synopsys.com>
References: <cover.1567608245.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_030056_141140_2F93D9A3 
X-CRM114-Status: GOOD (  12.17  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, Joao.Pinto@synopsys.com, bbrezillon@kernel.org,
 Vitor Soares <Vitor.Soares@synopsys.com>, pgaj@cadence.com, robh+dt@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The I3C devices without a static address can require a specific dynamic
address for priority reasons.

Let's update the binding document to make the 'assigned-address' property
valid if static address == 0 and add an example with this use case.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Change in v3:
  - Add Rob rb-tag

Change in v2:
  - Fix typo in commit message

 Documentation/devicetree/bindings/i3c/i3c.txt | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.txt b/Documentation/devicetree/bindings/i3c/i3c.txt
index ab729a0..c851e75 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.txt
+++ b/Documentation/devicetree/bindings/i3c/i3c.txt
@@ -98,9 +98,7 @@ Required properties
 
 Optional properties
 -------------------
-- assigned-address: dynamic address to be assigned to this device. This
-		    property is only valid if the I3C device has a static
-		    address (first cell of the reg property != 0).
+- assigned-address: dynamic address to be assigned to this device.
 
 
 Example:
@@ -129,6 +127,15 @@ Example:
 
 		/*
 		 * I3C device without a static I2C address but requiring
+		 * specific dynamic address.
+		 */
+		sensor@0,39200154004 {
+			reg = <0x0 0x6072 0x303904d2>;
+			assigned-address = <0xb>;
+		};
+
+		/*
+		 * I3C device without a static I2C address but requiring
 		 * resources described in the DT.
 		 */
 		sensor@0,39200154004 {
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
