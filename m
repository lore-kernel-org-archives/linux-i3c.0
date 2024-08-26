Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7D9C5320E
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Aug 2024 03:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VPV2AFAM9Xk/+FyJ/dht6dfXW3SC3fNTRwzGOjUSiAI=; b=FX6SZBnMMs/SEp
	2xpDPqAA7L+E2hJNCZHLUPOTQFiem58zZv4T27DVVo0n0W9ElnFDll1jIslejzslD9kjZ5ymBtFRn
	sEYFm1La/p/BkSp0kfm7fV5oD+MVu+3ZrMNZkLAge7KnDKUa6/IZpK/ToImYMviMRZ1n63M71SKZ4
	eqBEg8s8e0NZtRJPjKkqKOPI04oSfxv8MsEOXbQQlRRp+70PcnvWewEhQXV+89fzKv0DxDzCGPGjn
	c1zsNLQ8SMYXw+7PbXSRN7n/6F+ujyP1LLP03VTjvFjt+KZ1Pd3erSEQ0fP4BLgJs5qyHNEquAkcZ
	QWz0tT6f8558zVkTLAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siQYu-00000005fUb-1mT5;
	Mon, 26 Aug 2024 03:38:36 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siQYr-00000005fTs-1Nbm
	for linux-i3c@lists.infradead.org;
	Mon, 26 Aug 2024 03:38:35 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 26 Aug
 2024 11:38:21 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 26 Aug 2024 11:38:21 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <alexandre.belloni@bootlin.com>, <jarkko.nikula@linux.intel.com>,
	<billy_tsai@aspeedtech.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1] i3c/master: cmd_v1: Fix the rule for getting i3c mode
Date: Mon, 26 Aug 2024 11:38:21 +0800
Message-ID: <20240826033821.175591-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_203833_389812_57AD7EDF 
X-CRM114-Status: UNSURE (   8.47  )
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

Based on the I3C TCRI specification, the rules for determining the I3C
mode are as follows:
I3C SCL rate > 8MHz: use SDR0, with a maximum data rate of 8MHz
I3C SCL rate > 6MHz: use SDR1, with a maximum data rate of 6MHz
I3C SCL rate > 4MHz: use SDR2, with a maximum data rate of 4MHz
I3C SCL rate > 2MHz: use SDR3, with a maximum data rate of 2MHz
Otherwise, use SDR4

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Change-Id: If0e1100ca601c8a2f96ecbcc0f74e6fdb5e273df
---
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
index 638b054d6c92..dd636094b07f 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
@@ -123,17 +123,15 @@ static enum hci_cmd_mode get_i3c_mode(struct i3c_hci *hci)
 {
 	struct i3c_bus *bus = i3c_master_get_bus(&hci->master);
 
-	if (bus->scl_rate.i3c >= 12500000)
-		return MODE_I3C_SDR0;
 	if (bus->scl_rate.i3c > 8000000)
-		return MODE_I3C_SDR1;
+		return MODE_I3C_SDR0;
 	if (bus->scl_rate.i3c > 6000000)
-		return MODE_I3C_SDR2;
+		return MODE_I3C_SDR1;
 	if (bus->scl_rate.i3c > 4000000)
-		return MODE_I3C_SDR3;
+		return MODE_I3C_SDR2;
 	if (bus->scl_rate.i3c > 2000000)
-		return MODE_I3C_SDR4;
-	return MODE_I3C_Fm_FmP;
+		return MODE_I3C_SDR3;
+	return MODE_I3C_SDR4;
 }
 
 static enum hci_cmd_mode get_i2c_mode(struct i3c_hci *hci)
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
