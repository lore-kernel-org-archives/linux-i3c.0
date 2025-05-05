Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68B0C3ABDD
	for <linux-i3c@archiver.kernel.org>; Thu, 15 May 2025 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j2poe6NdmzGMc9Suv7wCIEOfJrePm4bD2EejQpm+1KU=; b=OJPw73KoCkLRRs
	roKnPstVovfFDUtWLHjqvhruoC3aOZye77fvXu2c+j6xXn5j3ERrJD+fQ0Zwao9tifqFO0iYY6fnM
	X6/LfhlEKY6vNMxp/sLR+2VQpXw30tjulSx7cC3lvElLhcN2fjyKRDacYLAU8VXf07uKpjkhDbGlY
	8Ar8zL5dzyRDMxVAnTHm/t0L2n+MPaQF7JAsT7WNdEEAWG9z+/wkQtIoGXJEIc+cruQcJqdb0kwkX
	CBVg8O2+eOIuFLShyW+J8W+6jIf6NNiRO6aON5sGLJC0n2g+bJwEOP34hRxPrF1/FwfKlsIlHZHpx
	EInvvcge9qFvdcNNNLqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUlk-000000008g4-0tea;
	Thu, 15 May 2025 09:20:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4xi-00000008yeJ-1iNA
	for linux-i3c@lists.infradead.org;
	Mon, 05 May 2025 23:11:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9301A5C5B82;
	Mon,  5 May 2025 23:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81625C4CEEE;
	Mon,  5 May 2025 23:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486661;
	bh=PvcQv3IFn7mpaCHcHeFH1JuyezztlM9bYk+8URrRkEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NqwIN+TRyOMDv8faX9F1GG8A7l5feOpiz3PSm4Am5iS2n9f4gHA2VIfd/6b6S1yEW
	 hMyAURLaoq0fwreoeVjlXE11RbMF1g20wEbj0SVsUUrrFcX3GdzO8quDbhFtHvkn+N
	 pfnzR0bSgkLEAyB8Hp5Kb7yd1zsPkIJ/xv+F6jhVGFT0p52hDOY6Klet4C+qQQEP3u
	 YiVJn6BJjS8lUS6dAf7ktJ1eKmP0NSOCCisnAx2o/KUiPPNXiD16TmD5zq2iGjtavp
	 bCuCHmjzIpS8GQp1VrQc45g11Lk8ob0GBkFenJefsMDuaqk74ixXwiMYguxya3xye+
	 6XVrBMdGhA1UA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-i3c@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 143/212] i3c: master: svc: Flush FIFO before sending Dynamic Address Assignment(DAA)
Date: Mon,  5 May 2025 19:05:15 -0400
Message-Id: <20250505230624.2692522-143-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_161102_491933_E250EC77 
X-CRM114-Status: UNSURE (   7.58  )
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
index cf0550c6e95f0..8cf3aa800d89d 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -833,6 +833,8 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
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
