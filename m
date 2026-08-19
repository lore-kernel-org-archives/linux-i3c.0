Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1A2C5B572
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Aug 2026 05:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WZTHfq9yZkfpu1bJpZZWA5jalkUX+fnRV4KuvtCeUBo=; b=B6wTDsBaGquhi/
	38pCmTYPqKd8Fme4MpIwQyKDaxVLI3xOiGhHMikhuN9pg6eXUu4qMqKQt/8FOlueIcUnBZHvIZkTR
	d9edR+ia3EgACnz5vBNu1F6m6jzSetnqQBg6n5OquXuLomeUHIXxxLqXsLuQn6HMq/oEk0u28nnIM
	j9k0aZf5uSkRVX3cboPDv7YAFVew95+ml2BISn6FMD6ESJ/+u4C/iC7ev6HZ1j+F9qVM2PCZXECrT
	hr/DEuirW6sNneRz3lSKFE388zemFD37t3fEVHqsJTywIXMucG1evpEfEPJUYfv/wMRRL1OJ8GSaD
	h1n5COyYBQ+ntd7nfXMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYX9-0000000907N-0crv;
	Wed, 19 Aug 2026 05:08:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYX8-0000000907D-0Vr7
	for linux-i3c@lists.infradead.org;
	Wed, 19 Aug 2026 05:08:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 782DB43766;
	Wed, 19 Aug 2026 05:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B727F1F000E9;
	Wed, 19 Aug 2026 05:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787116093;
	bh=g7C0zv5x+jXfrhhnP6wqNhC3Gt8L1uXqmJbvBhKnPtI=;
	h=From:To:Cc:Subject:Date;
	b=H4VOgsCPuOJHj2g2SxzRTwzcjs45/8WfeenarELcdb9GSSXdNC2IqVgXhkzwFGqge
	 kZpvuGa/hwUIAyyFdfj/rPwsCtZPMgIjDMTlKtQUQuES5z8RMxD3XvbmQ3e+bKcGML
	 bkHXHW0qr4QJW0zcbqMxK8soXrME/76ybykEllK5I8FJsgRAWtPSGPnQkr24sGACPy
	 xMwWeqkd9HC4hIusBeYcZFHCYVamIbMNbtnW1Qzpmo2yolK1y5CDgs5QA4qMyrU68Q
	 EPUir1jjcUi6x7qMAF7jQWxGv7UNCQqTfGm2DtMrjOpDFwRlqgJS1CAI/GMyNnI9/v
	 dFy9WOW60mFQw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] i3c: dw: reduce do_daa time if there's no client
Date: Wed, 19 Aug 2026 12:48:33 +0800
Message-ID: <20260819044833.32611-1-jszhang@kernel.org>
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
and the existing rx_count >= maxdevs check then reports an empty bus.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---

since v2:
 - rebase on the lastest i3c/next
 - collect Reviewed-by tag

since v1:
 - use another method to remove the non-necessary calling of
   i3c_master_add_i3c_dev_locked() if there's no client
 - update commit msg
 drivers/i3c/master/dw-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 0a3799a4ce87..4563d8761ba0 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -921,6 +921,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 		goto rpm_out;
 	}
 	cmd = &xfer->cmds[0];
+	cmd->rx_len = master->maxdevs;
 	cmd->cmd_hi = COMMAND_PORT_TRANSFER_ARG;
 	cmd->cmd_lo = COMMAND_PORT_DEV_COUNT(master->maxdevs - pos) |
 		      COMMAND_PORT_DEV_INDEX(pos) |
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
