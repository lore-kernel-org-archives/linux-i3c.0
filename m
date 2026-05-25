Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B49DCD5BB1
	for <linux-i3c@archiver.kernel.org>; Mon, 25 May 2026 14:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sz+T2V4eyT8mY672tKvWdNAH2sW+r45XtzxVzUVpW/o=; b=fau+dZ9ziTxhr/
	ek5ejozk9jVqmDO2O/ESiJ77LHZZDff0V7phGGWr6MgfC9qRfixOTDnwdKJuMWBCmwqALoxdZmR31
	TJbe9Db/pVd0St96urj2PivXaJgsJuZJNGio7EeIBlOG/5qnLK9s8bZLK2HzHJjjEM8vw+3afdaV6
	qhKGU765wpfQuaYQRqchZJx/JaQOU0uAfvXKuKlls/8kHHhGt9P7ciXv4D8ZOSGVS1multW5r+bBO
	rzMT1g+a2i0NPTU2dRzdkYPpo/XYKzAe4S9IBxe3Y0kR544sXjU+Y5EQAZIp41TQ+ThgsrETp8G+o
	NFpwKwdWz+OP/rxu5qIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRW9X-0000000HP5N-1Oyu;
	Mon, 25 May 2026 14:19:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRW9V-0000000HP4M-27Wk
	for linux-i3c@lists.infradead.org;
	Mon, 25 May 2026 14:19:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF13340216;
	Mon, 25 May 2026 14:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4551F000E9;
	Mon, 25 May 2026 14:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779718772;
	bh=Y0Ta+M9J4SmiVALp8xtiFc5Ub2xitdMsJyDhL48mVpo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kaoQSkGuKkjOkFedB2Pivm2NtRlX44ugVhOvOmjd8oNi8qCKzIERPi4gxZYZRLvwG
	 f9/l8kAJTZULFawrkl237DnX1EEQ4COkF6Wt9lCvRJZjahW+eUrQ6o8ndvNX7QG0wL
	 FYYBaO4tnDHjZ3GYl1MO6QK2tSZr+5s6SsGMPSylUWRAyCMsTu1H+EwB5jfybIzfDX
	 9ps2JainHNm0eoE4uetcM/bNxSoYBNr0mpBzb8U1V9v/+BP7tT0C179d+HtpG4vtjN
	 ZPX7keXVJVTpZu0C4ERqeYq9JOJGZ21GwZ8HqUkN9+XzyueL9rx5SA5E2GcgMRmnK1
	 jsoCqLF4W0HQQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 2/3] dt-bindings: i3c: dw: Add apb reset
Date: Mon, 25 May 2026 22:00:17 +0800
Message-ID: <20260525140018.19598-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260525140018.19598-1-jszhang@kernel.org>
References: <20260525140018.19598-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_071933_562789_5D997D12 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
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
index 613dce7757bc..2575442b28ff 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -38,10 +38,12 @@ properties:
   resets:
     items:
       - description: Reset signal
+      - description: APB interface reset signal
 
   reset-names:
     items:
       - const: core_rst
+      - const: apb_rst
 
   interrupts:
     maxItems: 1
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
