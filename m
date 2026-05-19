Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94C6CD4F54
	for <linux-i3c@archiver.kernel.org>; Tue, 19 May 2026 06:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9db9yXC98XiQ4qZpY3BKHaJtxgDeDBJTEUZk1V+eBgY=; b=U/ernU8K5Wi7U5
	JiMMxG1UkzgnGHNuo6xSJ/1aeijQTUOc2l3tnA5pdUylvbdwqlEONimK/YPvGHOHov5cGl1bAYDgT
	nISZcG5+rta86N49nSmkRNCP1gJkyCVq0ElMvetKR9xVE5fuDOB91IxNkjsMOrCumn5G5WQcj3z7c
	D0CCn8tgvtCgGSicIHnXCty2lwU///r9bEUaVYml3VZkpX9q7E4akmr9eo6iZg9ia0IaD6OJZhfqj
	4quUFVmIXuRfRIXbxSSPxlbMBIcu0jqk8dFmjxJuVq9zSQhGnO054N+5Uw35YTQn9Uul+GezlVcOY
	nXymsEtZuW7cEFXVjJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDej-00000000HVl-2glq;
	Tue, 19 May 2026 06:10:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDei-00000000HVB-0JWp
	for linux-i3c@lists.infradead.org;
	Tue, 19 May 2026 06:10:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B71060207;
	Tue, 19 May 2026 06:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75B9C2BCC6;
	Tue, 19 May 2026 06:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171015;
	bh=DswRk7ybF3fLnX3MJJEkMdXEDTp+sndW4Ikfc6SzmYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pWnbT7azwoFDGZ2cgzH739aopiBPMSZJ66RowHpanjAeu9ZCDvXaULoJQ8aVPXFfA
	 flCWnm+d+t2nDA5angnxRdlEkU8a7HXnwvLiNTUJlugsLrnc1bkcycXSF/bxebOydt
	 rIDiX4vuoPaUfqwFD8/PRFGhX8tUee2UyOclL7IGqlVh5fUzr5qjEc11hfH7xS4qLc
	 80FV0NshFJguz8BYIwfjQBBJ8CcelmHKcGXp2UUcPOA14FwAQvPkyk7Y6DMl6Wtehz
	 eEjERCqxsreB/QvVigBrL+y9CYHlkXPla81Jw/JwFwtJMiWZXR+vBnAi2OENnuaC9L
	 NhddF/HqvIkcg==
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
Subject: [PATCH v3 2/4] dt-bindings: i3c: dw: Describe core reset
Date: Tue, 19 May 2026 13:51:03 +0800
Message-ID: <20260519055105.13079-3-jszhang@kernel.org>
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

The core reset support has been in the code from day1, but the
dt-binding doesn't exist. Add dt-binding to describe reset property.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../devicetree/bindings/i3c/snps,dw-i3c-master.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index e803457d3f55..519797c6b4fe 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -35,6 +35,14 @@ properties:
       - const: core
       - const: apb
 
+  resets:
+    items:
+      - description: Reset signal
+
+  reset-names:
+    items:
+      - const: core
+
   interrupts:
     maxItems: 1
 
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
