Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1825FC54756
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 09:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRcI+2T64OjgAMXW9YXz6GDLWUTeNixTwcay0KgWNR0=; b=C6tz+o68mzAuRc
	+gFXoKxDWrFb+Z4XYjG+8o1Pi6Ah4iLkH4UNnO8GKqIVBJLbnBS0mCWIqzV1hvLV1UOAc+v6721oi
	OuksIxhPVBx06HWU4xGSnNscp/0Sv9HQbkCoaMGLkE9i0g5aSMaAhkZScqyH0rHmmS7w/5DwMTBeD
	AHoXPcVcxw5NJTxk4tjkPsdOGVFMQYBIzqxhL00YtHNVlBgtqhzrOsU7Uejo33fOmeqp5iIzlTj2j
	35TYHuJWVsM/MCS1LVFJkUim6D/B+pow/vpr4wk4N/rrcXWBhIgnbzA7DjWwRZ0dIjiZOYpehXKeZ
	DjFgXEKhAcC8uAVMPW6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUlf-000000008Zw-3UFe;
	Thu, 15 May 2025 09:20:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4JD-00000008lrh-1C7E
	for linux-i3c@lists.infradead.org;
	Mon, 05 May 2025 22:29:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF1C2629C0;
	Mon,  5 May 2025 22:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83508C4CEEF;
	Mon,  5 May 2025 22:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484150;
	bh=Qc6sRplHBpINBzNC6KWWgZA7v4kgorJW99xRFGHuJ8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JGCSdMrfWcm2KZOf1gNj6FXjfigvCfmR38jiCEKvrlm79hrrLnJCmX5ctbV12nLCd
	 AF16ZgTxVGDER6XGHM+uHk0J3NmaFEqnsfuqyF720wDGujqyVwcJz+SikPyIBkZEfm
	 EpC+BLAYx8Rh9fr1N26QILyTUJ3aRkcW7+SE3WK6nJUPnmRwiMGSZ4PCGWUxkzvaKJ
	 KmrIJwTIP8N/FM2RC4GkSzCc+xxipmQOVcTrqthgZyX5v32l94+A0MFaZat3L6pKAF
	 aPjcGe4zkS/kiuWeTaXqTQ1nbrn26madsBSVpgpivFswLfdv9mTQuSdsJYlJLMhoEe
	 qhZvuQ+1/Rw6w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-i3c@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH AUTOSEL 6.14 376/642] i3c: master: svc: Flush FIFO before sending Dynamic Address Assignment(DAA)
Date: Mon,  5 May 2025 18:09:52 -0400
Message-Id: <20250505221419.2672473-376-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Frank Li <Frank.Li@nxp.com>

[ Upstream commit a892ee4cf22a50e1d6988d0464a9a421f3e5db2f ]

Ensure the FIFO is empty before issuing the DAA command to prevent
incorrect command data from being sent. Align with other data transfers,
such as svc_i3c_master_start_xfer_locked(), which flushes the FIFO before
sending a command.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://lore.kernel.org/r/20250129162250.3629189-1-Frank.Li@nxp.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i3c/master/svc-i3c-master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index a18fe62962b0c..2cf2c567f8931 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -899,6 +899,8 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 	u32 reg;
 	int ret, i;
 
+	svc_i3c_master_flush_fifo(master);
+
 	while (true) {
 		/* clean SVC_I3C_MINT_IBIWON w1c bits */
 		writel(SVC_I3C_MINT_IBIWON, master->regs + SVC_I3C_MSTATUS);
-- 
2.39.5


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
