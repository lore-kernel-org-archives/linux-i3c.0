Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB960C55179
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Aug 2026 14:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z6kF5re0d0gLA1Jco8YaEVEPzQcymOMLL6ijrIepk6E=; b=45iXLthOr85coz
	WxEg8tOcZK4+bD881SoIXdQkmbMVhT8tAoUoITa/vZVZx1RKbi12550LYS32K5eMHFklt3K6CH1Hk
	u/v4ek7kUtDQK+FO9ToBn1vZpD5HCqsVjKKlVm4CwvXI96xrSN+OmZe6lU+hlzDFr/ITFdih49UQ1
	LifGs+Ga0jds8koI/Qdov+fgKMENrhJsQubyah0TDygBjXzxwXhODwNP0i0U+Te4MDrexnSL751T+
	/AkBc3m2N4xeH5RjFP1OvnOnCv/SOxBHI1BdUIRTIAapxDjFvKog+TLlsy1nN5oooagADwSU6qaBc
	MK4p/YxAtxS+AL/wCd1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtYH-0000000HNf7-1HjC;
	Mon, 03 Aug 2026 14:22:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtYG-0000000HNej-060Q
	for linux-i3c@lists.infradead.org;
	Mon, 03 Aug 2026 14:22:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DAB560A79;
	Mon,  3 Aug 2026 14:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DDE1F000E9;
	Mon,  3 Aug 2026 14:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785766918;
	bh=Y/WOqbRJsz+nO1gOIrvJEj4ZILrwHh44zY+hjxrM2t4=;
	h=From:To:Cc:Subject:Date;
	b=lBI5/VSmx9ZCTWYYi9iJQVSNuc82wi9u0GgP5N/qvLbPoWUp5qQBEnQY2BPw1ENG8
	 TMaAwoVN2wLAuZfvvZFi5LZqQKovz9DfyOswSBKCXxfyGx131ORVYJbxT1AiH7OM1d
	 BAzykEudjlaKjrXXaEZhjuaTf9WKq/dgrM73vaKr5PgsweGt4yGpRxk/a86kq9SnDq
	 ca5m8jXmd6j2wIEYaKC6z23U+47ptjSAwWxeT7wrCu2vLsO82z6kE9rcVn9UIdvWhV
	 STEmOsEDtL6fPNfrIETYaxmSUslTVSbRPjASAL5w6hZRVw0yzBSk0G6228OwVqHW41
	 qoQMtayizy9/Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] i3c: dw: fix APB clock name
Date: Mon,  3 Aug 2026 22:02:24 +0800
Message-ID: <20260803140224.12648-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
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

The dt-binding doc says the APB clock name is "apb", but the code uses
"pclk". Since the dt-binding is an ABI, we can only fix this mismatch
by fixing the code.

Fixes: a0d48ebf39ce ("i3c: dw: Add optional apb clock")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/i3c/master/dw-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 2f8c0c4683e0..0625587f1527 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1579,7 +1579,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->core_clk))
 		return PTR_ERR(master->core_clk);
 
-	master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
+	master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "apb");
 	if (IS_ERR(master->pclk))
 		return PTR_ERR(master->pclk);
 
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
