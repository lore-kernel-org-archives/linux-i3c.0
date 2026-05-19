Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC781CD4F58
	for <linux-i3c@archiver.kernel.org>; Tue, 19 May 2026 06:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5itdKgDu99nGoTAV+eziM0OQl+zxOiRPFOZx2iKrfu8=; b=CxxH5ZKxjjM27y
	jiKeDzooQVObKTpUQuSJ9SnpKITcrXeGKU8Mhhkyd60B5fjOuyd6AOHCn1skZTCQOfu1J46yHalHy
	0WjWUu1P2HNZJfRjR6WcxDsTawvLzsGFjXUWSdJf8aDDXAhXZgqBtR5M6wZ6dBLe1uga3PApfxKqz
	0gDYQsMSe5GrpAKKweVpjATC839rXwMmX9B6T1CDs+GTJ+le6KUl6Kn0ffrjpY1nfTTv5UuYjHFqT
	Bo3zN4GZ1ctPtbggZiJsyJpuJBVqxDCSypQ4Q88l1zAQwS+zm47DaG8htW8y1H1aX02XQMCc8OFTi
	zYpSbBiReCyhOVsMDTVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDel-00000000HWr-32Sr;
	Tue, 19 May 2026 06:10:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDek-00000000HWD-1g8I
	for linux-i3c@lists.infradead.org;
	Tue, 19 May 2026 06:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D6E2760052;
	Tue, 19 May 2026 06:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C54AC2BCB3;
	Tue, 19 May 2026 06:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171017;
	bh=c0dwo/Nwv8VNMf2IlZJikWHK3B6Jnw3FRG1Y+56m7Fk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q31fTeRRmzVAQma4ZFKMe4ShaxIy1ulegrkpEToh7NBnFZvXQStPF715TiuIiPIHH
	 lVkvHiNNB69yRd3Tbze6qTvEFrWTy+PSG4q4T5ks1xH3X0bVH70PHxDHFP3pKtYa6h
	 iS2ICFK7QtpM4rzQ18FXS4V/fY8fkSbbngYO7+4e0DYFrm3PC1ag9bCa9ce/hzOIAs
	 fpvc9pvcjIqgnxgZMEQ4rBwl5bf7enhavd7BS185CZKFwjb4sEAtODh0Risu8EtoNv
	 QeZq/kARI5bT0CGAyWYEDqd0iM048I2qKDoBkxkrXCcZajEnM0ds7ijVfzS2Vjfws0
	 Gi2zCBeF93UyA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: i3c: dw: Add apb reset
Date: Tue, 19 May 2026 13:51:04 +0800
Message-ID: <20260519055105.13079-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260519055105.13079-1-jszhang@kernel.org>
References: <20260519055105.13079-1-jszhang@kernel.org>
MIME-Version: 1.0
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

Add dt-binding for support of apb reset which is to reset the APB
interface.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index 519797c6b4fe..12845206772f 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -38,10 +38,12 @@ properties:
   resets:
     items:
       - description: Reset signal
+      - description: APB interface reset signal
 
   reset-names:
     items:
       - const: core
+      - const: apb
 
   interrupts:
     maxItems: 1
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
