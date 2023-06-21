Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F08C001DD
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Jun 2023 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eeR63sXdic8Eq1KN7CQztsiBS+NlOtqDRcbDvgVd70E=; b=MR/wpYvFDCkGrI
	lgxjV9vex+Bd4cvCT4shhrOMv2K5pwUkALXUclE3b+OlnqcI0vMaE+XFYSIybMFwQTHAPDQQeDPNE
	0Ymi7ZfNE75J8hDXl0UZf+jMll2hHXFjVdx+FrpX+wpaMapWV4BDdbBtXbztRc8N02ooSmmW0g8JZ
	MM70JUbTCSoeCpaO102HthOGxKc4TXJQ4FIn0CanUp9yWVCJSbM5Ao7M8mNJn35XPYZQEtCTicVb3
	GKGwCZbjSjUTxakdmaB44XF8PGTElPMlPN9Le5IK1OPuo9HLGHo1ggfmf2vUaRIV3z3qfGDr0w7+x
	/Tv5n0Yq9eq2YBimYbXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEohr-000fpl-10;
	Thu, 29 Jun 2023 10:16:55 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC0Z3-00F45w-1e
	for linux-i3c@lists.infradead.org;
	Wed, 21 Jun 2023 16:20:16 +0000
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qC0Yw-00CSar-IB; Wed, 21 Jun 2023 17:20:07 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
	(envelope-from <ben@rainbowdash>)
	id 1qC0Yx-001z4m-0c;
	Wed, 21 Jun 2023 17:20:07 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alexandre.belloni@bootlin.com
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC 5/5] i3c: dw; add print if cannot get resources
Date: Wed, 21 Jun 2023 17:20:05 +0100
Message-Id: <20230621162005.473049-6-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621162005.473049-1-ben.dooks@codethink.co.uk>
References: <20230621162005.473049-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_092013_562340_0DF23DC9 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 29 Jun 2023 03:16:50 -0700
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

The devm_reset_control_get_optional_exclusive() call does
not print any errors, neiterh does the clk_prepare_enable
or devm_request_irq() call.

Add some basic error printing to make the probe failures
easier to debug.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/i3c/master/dw-i3c-master.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 9332ae5f6419..ffc84ff6225c 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1429,12 +1429,16 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 
 	master->core_rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
 								    "core_rst");
-	if (IS_ERR(master->core_rst))
+	if (IS_ERR(master->core_rst)) {
+		dev_err(&pdev->dev, "cannot get core_rst\n");
 		return PTR_ERR(master->core_rst);
+	}
 
 	ret = clk_prepare_enable(master->core_clk);
-	if (ret)
+	if (ret) {
+		dev_err(&pdev->dev, "cannot enable core_clk\n");
 		goto err_disable_core_clk;
+	}
 
 	reset_control_deassert(master->core_rst);
 
@@ -1446,8 +1450,10 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	ret = devm_request_irq(&pdev->dev, irq,
 			       dw_i3c_master_irq_handler, 0,
 			       dev_name(&pdev->dev), master);
-	if (ret)
+	if (ret) {
+		dev_err(&pdev->dev, "cannot get irq\n");
 		goto err_assert_rst;
+	}
 
 	platform_set_drvdata(pdev, master);
 
-- 
2.40.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
