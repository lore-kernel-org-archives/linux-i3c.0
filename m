Return-Path: <SRS0=amWc=XA=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D31C3A5A5
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Sep 2019 10:00:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBB1521883
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Sep 2019 10:00:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l4n2lCvm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ExqotPmX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBB1521883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=d2PQhzbvFjQVAVyVDADlhrPtnF0U7pXiwjZCadfcUEM=; b=l4n2lCvmnxQSRSipEJTxTVtZFp
	e+sfSf00GN07rXU8QQLgHq9wJCptqihBsjOdS8HusNLYO9IrPIxqUOrEUNE2yzEbuZqKpKgcDCgqQ
	X/UrVu9//ZtFLxwosqyVqWFyJeEiGMtt3zYGZiCZpkA+zEZ/Evsm0BHqWO7JAhySbMCvQ1CH1YnYE
	tS2m+3yZJKcoJvffoLRpVGXpUvbiMvkIYr0KZ/tsfPkaUI5GKmjqa+dAMYY1YuAMo0OctpNxzBpa1
	sHa5LIR+kweuLwN5QjN3l+0Y93oCGOpSaBckqTm2zW4SFeKtDl+0MKenmzi1B8wbDFcLyZlfAEMvi
	Fdj1bUdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5oZV-0007fo-GR; Thu, 05 Sep 2019 10:00:57 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5oZR-0007cA-F1
 for linux-i3c@lists.infradead.org; Thu, 05 Sep 2019 10:00:55 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 04CEFC0DD3;
 Thu,  5 Sep 2019 10:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1567677651; bh=GosWZM2QU8S12Kgv9mW7HdYKBOJWFoe+3pD+Un3G66o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=ExqotPmXtPyrttYl0egCKAjoHy9K3A8M6MiMfU7TFhvGai2DEmP5d1TOunCx7WhsA
 bX/GnJnv1VfJMFtbFDRdN4gssi2BYXCTPQlYC70C2+asnrlOjoLQ1ZNgyRxIWobJDe
 rVyL2GEi/k7VN0bRoa6+QT+6F2pPczzRRDSXH7RYBjAj1tl8SBeCIbHd3i+9ysOLZD
 hE4U3OjOjWVs+wqf70sAlHGL4p5llwvdm1A5ZodZ2N5eHp1LTag1JfbKvxhkeTLgrk
 8R+WoNjcQTefQyM8qzXAVM+kK/a860lcqFq4C1w8ozE4F6B6DXLJ7FaTjyO+zeHW0Q
 ab8UtiEl4ayVg==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 9989BA0061;
 Thu,  5 Sep 2019 10:00:49 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by de02.synopsys.com (Postfix) with ESMTP id 826F43F3BC;
 Thu,  5 Sep 2019 12:00:49 +0200 (CEST)
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i3c@lists.infradead.org
Subject: [PATCH v3 4/5] dt-bindings: i3c: add a note for no guarantee of
 'assigned-address' use
Date: Thu,  5 Sep 2019 12:00:37 +0200
Message-Id: <f8a0cbc92605dbf5f41a28edd7691c3e90087554.1567608245.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567608245.git.vitor.soares@synopsys.com>
References: <cover.1567608245.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1567608245.git.vitor.soares@synopsys.com>
References: <cover.1567608245.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_030053_502442_0F00BB38 
X-CRM114-Status: GOOD (  10.81  )
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

By default, the framework will try to assign the 'assigned-address' to the
device but if the address is already in use the device dynamic address
will be different.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Change in v3:
  - Add Rob rb-tag

 Documentation/devicetree/bindings/i3c/i3c.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/i3c.txt b/Documentation/devicetree/bindings/i3c/i3c.txt
index c851e75..e777f09 100644
--- a/Documentation/devicetree/bindings/i3c/i3c.txt
+++ b/Documentation/devicetree/bindings/i3c/i3c.txt
@@ -98,7 +98,9 @@ Required properties
 
 Optional properties
 -------------------
-- assigned-address: dynamic address to be assigned to this device.
+- assigned-address: dynamic address to be assigned to this device. The framework
+		    will try to assign this dynamic address but if something
+		    fails the device dynamic address will be different.
 
 
 Example:
-- 
2.7.4


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
