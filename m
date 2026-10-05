Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD57FCA5FFE
	for <linux-i3c@archiver.kernel.org>; Mon,  5 Oct 2026 15:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9gbCXEnKxYtHgOWfgfD4c5VRxO98Sz3F3JhTrmt0N8=; b=PFtS5utaqDxmY1
	JKpipdv8pf7bon9d7a/QknkP7wsiPx6CqrNBxZnp/LFmqANZl6enRxulluNhj0PMyqyrizp3zNmYI
	LtO9wc1Ltts5twcZXjB/0eeaF8BhSVRmjMmAzzpUYmERbqpAiZ1vuxozuF2N/yoHz5iV97dESdtVT
	t7III7n0PiD2Fmp2SL47s/tbxnpIdyz8h4cwCfXre2EM46guEStzTqERUBo/nmnz96QGn8y5KMFvV
	Tyn1rOC23++Hp+shGkbfNrdpzrsCIFm0/UT7iaBEnA6SN0MvUbHGknV2UtqzVjp9UQ7z6WBaCkWB0
	FSBtqAv+CEDLRlCIxX5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkrf-0000000GmXY-1zN7;
	Mon, 05 Oct 2026 15:44:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkre-0000000GmX3-2OaU
	for linux-i3c@lists.infradead.org;
	Mon, 05 Oct 2026 15:44:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 55D5243F99;
	Mon,  5 Oct 2026 15:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034EC1F000FF;
	Mon,  5 Oct 2026 15:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791215070;
	bh=mTORbDJVqeinsGFiaCY9ee6z/kWfWSZ1rLTYTDZgJ4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EVnpLqp0hL1aPHEY897uAAAvgoI1yNkL+yz7TobSQeCaML2OAazz61c2YB7IaNlab
	 PyX5HfnAWvGXEUjqMHZUg/T8hBZntbHjh1xaQutMd1kAKalOZev7K38ayvlXaSh4Io
	 8rk8HatncEngdAHoHdFTjrvBtk8ByRXsYFYyOHmVbFlhuGe6aRaQ05EQw9Su27auKn
	 lT24bD1jmVbbUTNY0UbByg4NBLhCNyryn344HUlAiwxGheukSbnNFHcEVpugnpq1vN
	 SbmjxONDXYQuFOyDTpqr0sPusUjo5Qo0OpykUDLgqqGLlRVMIgRVr3g7OZLs35jOYj
	 gWUEXMAqz/NRg==
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
Subject: [PATCH v2 3/3] dt-bindings: i3c: Add Synaptics sl2610 i3c
Date: Mon,  5 Oct 2026 23:24:25 +0800
Message-ID: <20261005152425.25319-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261005152425.25319-1-jszhang@kernel.org>
References: <20261005152425.25319-1-jszhang@kernel.org>
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

Add the compatible for the Synaptics SL2610 SoC I3C controller, which
is compatible with the Synopsys DesignWare I3C.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index 6da7d90caa3e..6806a22114f9 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -27,7 +27,9 @@ properties:
     oneOf:
       - const: snps,dw-i3c-master-1.00a
       - items:
-          - const: altr,agilex5-dw-i3c-master
+          - enum:
+              - altr,agilex5-dw-i3c-master
+              - syna,sl2610-i3c
           - const: snps,dw-i3c-master-1.00a
 
   reg:
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
