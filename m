Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DD7C27C4F
	for <linux-i3c@archiver.kernel.org>; Wed, 26 Jun 2024 05:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kyKANhjT7GwzPYoo31osoR4BNQuFDWYf3BDu/17O+T8=; b=1f2yFBs4xQRNGmtGhhVsg1MXoy
	+6n/mEo0NyQKKYaC6fbOKVVWHTwkFxQSPKNfvknC3gz8NP9DLHNgLz/Xun3iPpiLrIfzgMBNy1I+t
	aHq0IEQITUsoyLgV4kOytHvElmWrehQt51KbPdJwXUXa5uYs1yRJ6Y4RyIYwMoML5JiEKZSpKIO8N
	soSjrrM/vYNHKN9XUrkDSGeyMCWTPZYplE9sdWtHvjHPUcoelpKIg7p+kzXNwMEKn6ZdizHEZG0GE
	ZZO9bMrKQO9FvJXL2pvlewZ9JvEy8xLK3Dp99hcCjeXZR9r3NGq2i1H/MaZ8WG1YVX0a7/uCZE1uL
	OIFeHfIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sML7T-00000005Rq7-2YoJ;
	Wed, 26 Jun 2024 05:22:59 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sML7P-00000005Rmq-3hsk
	for linux-i3c@lists.infradead.org;
	Wed, 26 Jun 2024 05:22:58 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dfeec5da777so12384917276.3
        for <linux-i3c@lists.infradead.org>; Tue, 25 Jun 2024 22:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719379374; x=1719984174; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jJp+j3ZA1th5Jj4gYDkzEc/kDoBtu3dOqn1pl2+YPAA=;
        b=BgbrOCE8Qbp6CFMquWYPWX/6SPc6c4S1aM4EQqFCQ3ePDTorN14/rgxOY3TtaXkDG0
         z/Ht8zJjIXpnm9NofRt2Y01KJkpPgc3vL3snB/l+AGg0nBQwTFp8d9NGv5z4R1bZZqgN
         8woc0t59arF+7c/1Cxpz4xrjQnPTyqsSslTGmL8C7ByWnaoiO043Imq6HB1yvagYqOmF
         mUIweMV65iZzaGGsRLcq4YC1NkjnJsx/b6yliN7+jdXV3FrNDMyBtee9oPs3omfmyqin
         w3CvNJYJH3hC5FIHVA1rL+xGSp8m7YTTQZw/FmJXpLY5HDLDrexXkgl2wo4o1zOt2eVQ
         re5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719379374; x=1719984174;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJp+j3ZA1th5Jj4gYDkzEc/kDoBtu3dOqn1pl2+YPAA=;
        b=ldaTuGyjpUr9V4G24/YRd+1iQ75EAXPOcWmvHf/u6Nh6uBxO/wI2MQaODYcPXU5a69
         1jQvzUDFYN6pFR3rp4UfDRW5e7V83y7O/gxer1/N49bJbemmX36Zt7rI+aTusNXFfBQx
         5W0ZyheBXHhIrRtmWWQeIvxmO8WRtjU/pC+fLWBeCePHqbtuzyH/wMs2H4RSz0hyIjBm
         xhUWz7lJztEXokwgXzP1ZLnKNsi+u6KD7wyTOvF1dag7NPfuolojtsxHWyJPLyAgwjui
         XxYV3u6yS7ds83BmWaHek8FSKkPM3+Pf/1676hOoyJ7b1pMsmmvmAA51F4KmqukgjCq1
         oVzg==
X-Gm-Message-State: AOJu0YxCH0cV/rwyh0Fg+HVmLCCqviBI6aIX7meCuBBZcw54yxHX1pXa
	uFG+7HOmFON3kzBg6+OUmj2D+nNj3tq4H+EHlpTBTi/talVrnaL6w7uWPP5KUX3NMmjKdiRpMlV
	JKumrdflClMEsP6vxC++o9JWobQ==
X-Google-Smtp-Source: AGHT+IEAEget9B2vSdhGeLcEtW2e3iM8MJIc4bsMLsrXaEbRkZRTj4Qt0WXm1du3qsvVE9pndMPWkZy9XMdUDczBICE=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a05:6902:1893:b0:e02:5b08:d3a with
 SMTP id 3f1490d57ef6-e02fc29cc0emr62562276.0.1719379374381; Tue, 25 Jun 2024
 22:22:54 -0700 (PDT)
Date: Wed, 26 Jun 2024 05:22:38 +0000
In-Reply-To: <20240626052238.1577580-1-aniketmaurya@google.com>
Mime-Version: 1.0
References: <20240626052238.1577580-1-aniketmaurya@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240626052238.1577580-3-aniketmaurya@google.com>
Subject: [PATCH 2/2] i3c: dw: Select ibi ops for base platform driver
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_222255_962609_A8927368 
X-CRM114-Status: GOOD (  11.22  )
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

The AST2600 platform driver can always select the IBI ops.
We also need a way for the base platform driver to select
the ibi ops. Hence introduce this DT property which can be
used to register ibi ops from the base platform driver.

Signed-off-by: Aniket <aniketmaurya@google.com>
---
 drivers/i3c/master/dw-i3c-master.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 77a2a1c3fd1d..dff4f8e4e44e 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1547,6 +1547,9 @@ static int dw_i3c_probe(struct platform_device *pdev)
 	if (!master)
 		return -ENOMEM;
 
+	if (of_property_read_bool(pdev->dev.of_node, "ibi-capable"))
+		master->ibi_capable = true;
+
 	return dw_i3c_common_probe(master, pdev);
 }
 
-- 
2.45.2.741.gdbec12cfda-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
