Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132E5C3ABC9
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 10:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1oplhMltVA2v4XB3zeNgpD1a3FOEQJpRWlg1Jrvm9o=; b=WpnDlSsM3x6i7X
	0bI6goyHrgM1fmS3GWAde2+/0ies2n9Yz8MVBKIl6Ac1Q4KCzwRk135DwK12ocq58gQS4reyWgqMX
	p7bc81UVTR2QkNcRjs/lNmZa4nYbL0UVKBoo7pLnk9N6ESL377m/dRZfOBBy3/fHQgWr8TtXINqdb
	sLCg5+OQIatblhepreDlJcKVKStx94CGwKaJ6yu1o4oD2cTXCDOFuBcbHzhLfgYtjn3iP2njCydI0
	j7YOzgbe8b9FNxtf2MzUjqDvrIYDJd7qRelDJiVxyNtN85SjZVBp1uPHZy/Ur04OFMyRjTKutwBsF
	2lMUamrGI4LnAQ+Gx10w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVuv-00000000J31-3Tyc;
	Thu, 15 May 2025 10:34:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4pb-00000008wFu-3ptv
	for linux-i3c@lists.infradead.org;
	Mon, 05 May 2025 23:02:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 360B55C5B5B;
	Mon,  5 May 2025 23:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4BCC4CEED;
	Mon,  5 May 2025 23:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486159;
	bh=D/r/hSjmZp9qNL7wF9FusFAnmVmbgEPC6MUHKcJAZTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e2suoZh/TFeb3LowHuuA04Oq7Ctoyu/CCnuz9UYfo7V2QpXqoTOpdrdZxSMNXXrKg
	 EyBb+UIprjehiGJ+v4bLotCKAfzmPURJeLMrJN0wwnmAxm7QAmY94wTWmqj+f5PqJD
	 +I5Ve1o9WTbCDdRoHT3Ay2rN8j7OlBOB08uprgr1O1nKX4gjV66KB19Y6GmSSl0SwG
	 4coQiQIFtNiXEhqXIFpTaLxlrGQ7PhPg9mrqP+KqTpIOF54d4vFsWj+hbTC5d+bZ26
	 hRopoh1IbAQAKjqTSId02yH/AxMG/wDAA7oHoG2iVCTpHHYobgXpAG3CBnxzCj062o
	 pBIyreXGpKPhQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-i3c@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH AUTOSEL 6.6 184/294] i3c: master: svc: Flush FIFO before sending Dynamic Address Assignment(DAA)
Date: Mon,  5 May 2025 18:54:44 -0400
Message-Id: <20250505225634.2688578-184-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_160239_995259_5072F007 
X-CRM114-Status: UNSURE (   7.66  )
X-CRM114-Notice: Please train this message.
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
index 3cef3794f10d3..3d1734849e0d9 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -841,6 +841,8 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
 	u32 reg;
 	int ret, i;
 
+	svc_i3c_master_flush_fifo(master);
+
 	while (true) {
 		/* Enter/proceed with DAA */
 		writel(SVC_I3C_MCTRL_REQUEST_PROC_DAA |
-- 
2.39.5


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
