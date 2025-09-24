Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A62CAC5AE
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Sep 2025 19:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vqbPiPhkxUUijSKWQteoiS2Gj/m2sz1s/Bg5AtcLp1I=; b=16wBhuRb4UuX25
	/y72NhBoJn9aTdmyCpl0HRsMThGpnKyU37c0597o86z1H3JoA2QjdCpyY82Dlrakz2lZY2MkcZaZK
	6Rwib5GCy8g8qnWMZy/MtEz70nkUlna0E/sFN/b7+v4WjiSGaprqVi6t7xEeYGMZYEHsSxwOniY+6
	wCLl7nbM4pCie8Ba5go1uVuKLiVfZnYEomlYJAAotJQJmNAvI7NDoVgNa3qlZaeHZ+xPz/JMVnaXB
	MqQ0km944EpTEvyS3QWNMwC/qyIKwRFFFnDA3mGm6gq03Rk+VAFmiLp5hjOsAlqYaeeTJO52jK4Da
	KBkZ8sw9X6/RrVX0/kmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1VbA-00000003GDd-0NTW;
	Wed, 24 Sep 2025 19:56:20 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Vb7-00000003G9R-0Rd4
	for linux-i3c@lists.infradead.org;
	Wed, 24 Sep 2025 19:56:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 48CE81A0F89;
	Wed, 24 Sep 2025 19:56:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1DE5760634;
	Wed, 24 Sep 2025 19:56:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07437102F1875;
	Wed, 24 Sep 2025 21:56:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758743773; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=qgbwk8TYbiHBOGbfoCQ5QpKJ1sVltwaWlsA72FQdWzc=;
	b=VoZryYF9K8OJR23YwWFgiqvn/EgvJ5SIk9daxNqgxC6Z3VuCYbIobfhGL2ldDeFxKJSQ9D
	FMAcFi+LXvkUnWEdkML9ewr18NqZ9H/J3kak84VCrmccCYFsBwUBARigZdRnhHagMmFE7f
	yyx4xpoGXkdJEHCNWnGVxkhAIB6wPmnt97cRHZAslIIZ2wPYEkhS28d+CV/WSk/HD/+UkE
	mKeYCWm9Z56zB2LsP591PZ9oLbhdxvp2OIG8PKXXfFOvXxkcpDB17Hk4JGLhCW5b7mP8IJ
	V2HHnQR88AlCn5RFGsZjB9WUi9a4Xbq48jEuYM9Dkqw/d6jhUi2ytoPPiuwhbg==
From: alexandre.belloni@bootlin.com
To: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: kernel test robot <lkp@intel.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: master: adi: fix number of bytes written to fifo
Date: Wed, 24 Sep 2025 21:56:00 +0200
Message-ID: <20250924195600.122142-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_125617_277242_F776A655 
X-CRM114-Status: UNSURE (   8.71  )
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

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

adi_i3c_master_wr_to_tx_fifo computes the maximum number of bytes that can be
sent to the fifo but never makes use of it, actually limit the number of bytes
sent.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202509190505.fKGvEJRa-lkp@intel.com/
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/i3c/master/adi-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
index 18597ba1f1c3..82ac0b3d057a 100644
--- a/drivers/i3c/master/adi-i3c-master.c
+++ b/drivers/i3c/master/adi-i3c-master.c
@@ -135,7 +135,7 @@ static void adi_i3c_master_wr_to_tx_fifo(struct adi_i3c_master *master,
 
 	n = readl(master->regs + REG_SDO_FIFO_ROOM);
 	m = min(n, nbytes);
-	i3c_writel_fifo(master->regs + REG_SDO_FIFO, buf, nbytes);
+	i3c_writel_fifo(master->regs + REG_SDO_FIFO, buf, m);
 }
 
 static void adi_i3c_master_rd_from_rx_fifo(struct adi_i3c_master *master,
-- 
2.51.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
