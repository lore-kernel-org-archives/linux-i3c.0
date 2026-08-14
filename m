Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC7DC5CFC1
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Aug 2026 04:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N40gFB8JrkAPVS7CZbu9yqapWPQCj9TpiVVoIQMLFKo=; b=10r8t/55884Hgo
	WuZEUCm8YoDEWlRThbrOdijnVJvUOhsB8CiG8838EI1Rypx/3BfOSJbVkx4z4wWP8X5m4CgIrTwBZ
	m9q0NSyDEYB2E7W21ilh3FN9WDP8AJb0HXIofYRfe0Ymu/u3ZATtlj0Jd/wCreJaarWPXoD06ca2G
	KoQZMWukzUsLi08G0XtaPRyHxLbWP8903qthiLaHrzV9Szk5xhpSa+2DHYoM2RDTPo/qfXo6McCeT
	mHUkueI5+9ENzabe2bmLpW06hWNJuFni/WDzdP4IFVWOBSfr4Z/mlMyYxM+y504LG1M3D6fBjojap
	3fcMUhJZuwGJDJhOCggg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wujhy-00000001wV0-3J8s;
	Fri, 14 Aug 2026 04:39:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wujhx-00000001wUu-1YUU
	for linux-i3c@lists.infradead.org;
	Fri, 14 Aug 2026 04:39:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA41642339;
	Fri, 14 Aug 2026 04:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB5A1F000E9;
	Fri, 14 Aug 2026 04:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786682392;
	bh=WA52jFGCTiWvUw93Fa+qfHMHLvnniBEtjegFKYacuuc=;
	h=From:To:Cc:Subject:Date;
	b=BJgXksi2XZJ52xB0GTCl2TDwgj1u1GYWGreRSSh0+fBSFRyS4AzpZDQ1/a5WyXvKB
	 Pwu4kcJaOWTvrE9SB0pmXV34I+u4RlvVtN+GX8VPWGYR/u04EDGmP41v2JcmG+449w
	 85knuOstYmiBLH393d617IQ6UGV9Xpm/CKxEZBsBuHh94h/+nhstsUZpQ1LeXQmURz
	 LLCyKlMhKzgw4uJexlgiR4HgbFVd1rm7eFflZnxhxailZJ3e3QNXbLgGKbXjrnYAmf
	 RxW2tHlgl4xx5tLiGqzy5VHCDpqPbN5W/ULbKAhry2tsNvsIkTlAeiQbsWyCxrQ7BG
	 7Upxy1ak+eOtg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i3c: dw: reduce do_daa time if there's no client
Date: Fri, 14 Aug 2026 12:20:15 +0800
Message-ID: <20260814042015.25397-1-jszhang@kernel.org>
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

dw_i3c_master_daa() derives the number of newly assigned dynamic
addresses from cmd->rx_len, the ISR sets it to the number of address
slots ENTDAA left unassigned. It starts out as zero, which already
means "every address was assigned", so a timed out transfer leaves
that value in place and it gets used as a result.

If there's no client connected, the addr assign cmd times out, then
the driver calls i3c_master_add_i3c_dev_locked() to add devices that
are not there, each costing about 1s, thus adds non necessary boot
time up to (maxdev * 1)s.

Start from maxdevs instead: no address is assigned before ENTDAA runs,
and make newdevs as 0 if the existing rx_len >= maxdevs.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---

since v1:
 - use another method to remove the non-necessary calling of
   i3c_master_add_i3c_dev_locked() if there's no client
 - update commit msg

 drivers/i3c/master/dw-i3c-master.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 1053cfb05c05..883b542c7bfc 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -876,6 +876,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 		goto rpm_out;
 	}
 	cmd = &xfer->cmds[0];
+	cmd->rx_len = master->maxdevs;
 	cmd->cmd_hi = COMMAND_PORT_TRANSFER_ARG;
 	cmd->cmd_lo = COMMAND_PORT_DEV_COUNT(master->maxdevs - pos) |
 		      COMMAND_PORT_DEV_INDEX(pos) |
@@ -888,7 +889,10 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
 		dw_i3c_master_dequeue_xfer(master, xfer);
 
-	newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
+	if (cmd->rx_len >= master->maxdevs)
+		newdevs = 0;
+	else
+		newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
 	newdevs &= ~olddevs;
 
 	for (pos = 0; pos < master->maxdevs; pos++) {
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
