Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19471C3ABC9
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sbQmnTDOMgyIHX8BawjTxtCT46Qj2Y0Ex30/4egWNCQ=; b=rP4NFJyqOzl4Ct
	36uGSRlAl5rTTMik9EciUNKD804B8xBtbvXkMAOk6jgAuqwsIKO28praOhYBPrjnwY1CBUGO0Dz1k
	thQhhdMRv1Rkpr58v0ElJ5zKQK4FsV0ZN6HlZTkOXbHTFrCcBUjs89qEBU3WRU2miGsEMcHErv8XM
	PtCiL0POoWUUCrpL8iXxJZPdlJmMTQ+8bMdRllsaTEC+gtCadjro3C7MwHOFWIAs8qvo5MBa09AEA
	gtK6JDtk+ZBwM6az1ugugMFk0ZVl294ijZxqWROk38Zs86Q7ByS7pLgkmeNKzgQHtPhwndHbmCSSL
	4gJnVl1I3sVyRe0+w9zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUlC-000000007zC-39rZ;
	Thu, 15 May 2025 09:20:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1qxm-00000001UIK-3xf2
	for linux-i3c@lists.infradead.org;
	Mon, 07 Apr 2025 18:12:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E78E149F74;
	Mon,  7 Apr 2025 18:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EDDDC4CEDD;
	Mon,  7 Apr 2025 18:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744049570;
	bh=2t8t0F9zeWJL6ngosXiE6XTK7TFO9G0uejD+Xa30WN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LludQa5xe6NA9ZDizMkvRzBPNFFs6JcTIG4S7VomaGAABy0yPQ+GIbFT8NoqCoj5R
	 86beydL4csr8vN6Ab5366M9Am7puetlWz6MXbs4hWP5nQ10GHSmVgLczh4E9BuetbG
	 fmzvmEe2G617+c4ccDoNAWrOWGq72fSG8CrsvBWEFWxHahA+neRa2MNQBXphTAkrOo
	 FVo/KzY4QjLHCDe/7QSJyIDXXfZCJVcofGQhaA4H7yD+znEBHV4UB9emPqB7H1KCCp
	 FQZBLABlbGXp5xzTlgAB6R38BzN3pN+cl66B88sIijF4jJrW2RNR4fRH+g1SrgozRk
	 hoSHwub30mx3A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Stanley Chu <yschu@nuvoton.com>,
	Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	miquel.raynal@bootlin.com,
	linux-i3c@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH AUTOSEL 6.13 13/28] i3c: master: svc: Add support for Nuvoton npcm845 i3c
Date: Mon,  7 Apr 2025 14:12:03 -0400
Message-Id: <20250407181224.3180941-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407181224.3180941-1-sashal@kernel.org>
References: <20250407181224.3180941-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_111251_013421_0FFDF26D 
X-CRM114-Status: GOOD (  12.65  )
X-Mailman-Approved-At: Thu, 15 May 2025 02:17:27 -0700
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

From: Stanley Chu <yschu@nuvoton.com>

[ Upstream commit 98d87600a04e42282797631aa6b98dd43999e274 ]

Nuvoton npcm845 SoC uses an older IP version, which has specific
hardware issues that need to be addressed with a different compatible
string.

Add driver data for different compatible strings to define platform
specific quirks.
Add compatible string for npcm845 to define its own driver data.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Link: https://lore.kernel.org/r/20250306075429.2265183-3-yschu@nuvoton.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i3c/master/svc-i3c-master.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index d6057d8c7dec4..40269b692aa87 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -158,6 +158,10 @@ struct svc_i3c_regs_save {
 	u32 mdynaddr;
 };
 
+struct svc_i3c_drvdata {
+	u32 quirks;
+};
+
 /**
  * struct svc_i3c_master - Silvaco I3C Master structure
  * @base: I3C master controller
@@ -183,6 +187,7 @@ struct svc_i3c_regs_save {
  * @ibi.tbq_slot: To be queued IBI slot
  * @ibi.lock: IBI lock
  * @lock: Transfer lock, protect between IBI work thread and callbacks from master
+ * @drvdata: Driver data
  * @enabled_events: Bit masks for enable events (IBI, HotJoin).
  * @mctrl_config: Configuration value in SVC_I3C_MCTRL for setting speed back.
  */
@@ -214,6 +219,7 @@ struct svc_i3c_master {
 		spinlock_t lock;
 	} ibi;
 	struct mutex lock;
+	const struct svc_i3c_drvdata *drvdata;
 	u32 enabled_events;
 	u32 mctrl_config;
 };
@@ -1817,6 +1823,10 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 	if (!master)
 		return -ENOMEM;
 
+	master->drvdata = of_device_get_match_data(dev);
+	if (!master->drvdata)
+		return -EINVAL;
+
 	master->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(master->regs))
 		return PTR_ERR(master->regs);
@@ -1958,8 +1968,13 @@ static const struct dev_pm_ops svc_i3c_pm_ops = {
 			   svc_i3c_runtime_resume, NULL)
 };
 
+static const struct svc_i3c_drvdata npcm845_drvdata = {};
+
+static const struct svc_i3c_drvdata svc_default_drvdata = {};
+
 static const struct of_device_id svc_i3c_master_of_match_tbl[] = {
-	{ .compatible = "silvaco,i3c-master-v1"},
+	{ .compatible = "nuvoton,npcm845-i3c", .data = &npcm845_drvdata },
+	{ .compatible = "silvaco,i3c-master-v1", .data = &svc_default_drvdata },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, svc_i3c_master_of_match_tbl);
-- 
2.39.5


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
