Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6335C761AF
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Mar 2023 13:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GG6LKcZ/rbSpqx2yrlFjAJfLGhIC5ODIms0nEsBVsC8=; b=ii8i/MNQmlJKtX
	LO/lhnEZ8z+rJvZZbqIKIPBmsCaW1RgW4ZKld/c0FnPn1NhJlbLLN08X/NPGyjUk0M2m6eA0+MNpe
	HxIZTTO2HV6O6MVb9uT7Pl1cB2ewx/NxNTIeX5JZryQ3t0YjItzBmfsaP74+a7MoKMp6qhlfAJFF2
	7MNv3jumG4R1NSoJGBXZutitqYzR+CYO1sxPgSCdwEICfj1Lhf6DZ5wCV8KOgXUXv9dfUEW6SIzY9
	722z8YebvRje8WhF5EV3RXgELmDUOwlDLzw2dJnuyuR+x95vIysK6HEV1P9NKrTqm/Vv42alegGed
	44dI7IRTusW4OrOe8qFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phscu-003vTy-0V;
	Thu, 30 Mar 2023 13:47:40 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phn3a-002yjp-2C
	for linux-i3c@lists.infradead.org;
	Thu, 30 Mar 2023 07:50:52 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 019F020127; Thu, 30 Mar 2023 15:50:48 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680162649;
	bh=z/TACczbFu3Yfs10OBzMNiA9zv6dYykbn3vOqc4lSkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gkMJZJqWMQD1OWUeykS/HrQ0XEf9mFLzBXEmdZJKZk5jSVgjsFRWDH78iqwqZzNKo
	 hGFEZ/w+3Q2P8yeJ52H0Hrq3/jtdJojyR7ZuvwFd+6jrRzVpBZCZxiQb+Lf8UMmT4w
	 uyxOzn+83izR4TMnKaqSa/3loooxoZE1kFk5Ln4Xy7y/iDycTJmWTa6ht2sQoMtgT9
	 pi7C5UmcDBqTum33vvl6W97xgHea3K+hOGG+COXQQPIVOmS80xbEfV4mTRWk/fA2R6
	 pOE5tjwqwJsAuXHxa44Qx+fy7jQUfanBVSUoXVzaYvo7YW+2LuZLMdZ6JRzjiNuSCz
	 0eVTiDaAiYAjQ==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: Matt Johnston <matt@codeconstruct.com.au>,
	Vitor Soares <ivitro@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jack Chen <zenghuchen@google.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Dylan Hung <dylan_hung@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 1/5] i3c: dw: Create a generic fifo read function
Date: Thu, 30 Mar 2023 15:50:32 +0800
Message-Id: <827204789583dd86addffb47ecaeab9d67cf95d5.1680161823.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680161823.git.jk@codeconstruct.com.au>
References: <cover.1680161823.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_005050_910020_8A33F627 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 30 Mar 2023 06:47:39 -0700
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

In a future change we'll want to read from the IBI FIFO too, so turn
dw_i3c_read_rx_fifo() into a generic read with the FIFO register as a
parameter.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/i3c/master/dw-i3c-master.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 9fc03108a5db..cb38ef95f21a 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -318,18 +318,24 @@ static void dw_i3c_master_wr_tx_fifo(struct dw_i3c_master *master,
 	}
 }
 
-static void dw_i3c_master_read_rx_fifo(struct dw_i3c_master *master,
-				       u8 *bytes, int nbytes)
+static void dw_i3c_master_read_fifo(struct dw_i3c_master *master,
+				    int reg,  u8 *bytes, int nbytes)
 {
-	readsl(master->regs + RX_TX_DATA_PORT, bytes, nbytes / 4);
+	readsl(master->regs + reg, bytes, nbytes / 4);
 	if (nbytes & 3) {
 		u32 tmp;
 
-		readsl(master->regs + RX_TX_DATA_PORT, &tmp, 1);
+		readsl(master->regs + reg, &tmp, 1);
 		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
 	}
 }
 
+static void dw_i3c_master_read_rx_fifo(struct dw_i3c_master *master,
+				       u8 *bytes, int nbytes)
+{
+	return dw_i3c_master_read_fifo(master, RX_TX_DATA_PORT, bytes, nbytes);
+}
+
 static struct dw_i3c_xfer *
 dw_i3c_master_alloc_xfer(struct dw_i3c_master *master, unsigned int ncmds)
 {
-- 
2.39.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
