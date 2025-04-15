Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD41C369B9
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Apr 2025 05:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cqT7HdJ0bZ7VzbG7bymB769I29MYnzJoNGgGcgnTm1s=; b=Cr14czOKE0lc8q
	jiqHaHecGOjB3yQ4wqHLKTmO8SwmvUz1VsgS5JghwCm9eKXrj3Mhn/bK+ZcuLO/QUOOrxLPEYYhMD
	LVr8N+9Xcj3TBL4CknZ9sGvL/DHUBy4FPHddyvquQidT3UBjnfXmlKc8N+DNi++siEAIBotWQ1KGg
	Xy/DX5HqazHPKBYcHf6wEKWY8dqmcvayp9H96eevRG6NEIzGa9Rvcix9PQJNhHKG3J9/jjrxO+OlD
	eZ5kCfB9Ve055jgZF/zYlodrmYdsfUGtvDzhiexN7cD955m5XUF/Z27NPpDv2P5ugvIxmOeOIW6Gt
	rmhCGByHte3o66QtOILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4YuB-00000004YuW-2qiD;
	Tue, 15 Apr 2025 05:32:19 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Ygj-00000004XBO-0JJZ
	for linux-i3c@lists.infradead.org;
	Tue, 15 Apr 2025 05:18:26 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so4512176a91.1
        for <linux-i3c@lists.infradead.org>; Mon, 14 Apr 2025 22:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744694304; x=1745299104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7xAbEEI7p+I6WmGNc8jAy6i7DcwaAU5md+L6Ye5HR0=;
        b=QxTCjiZLswsj8VDpyixDP66mymGOvdFKsecIxa2u7Kgp+dkpfyFPF3dU1FKOa1YVPu
         0J4/TU24P1giV8dqOo1D2dxpSFSQqEq1bCOBuOMVinX/mWk1RjCrHtFnLR+PdQfiH8lx
         Avtlg8/o1uJS5Lea2+g8FyKK7h2swmmHLHgJHD5WqVio5WfVzNEbUVIXEANo3HBRPdrd
         adD3DGOUSDEtuoudmHYiU73U1Z6dNf8nSOK7Ky607Eq8PjBT/vrtw8bcBA5mJNCeXI9R
         1n2+I7oLIRxaRyCeTKWXAmMT0j4K+78r/0qP1oOgcvIUEQvfln1b9yFRz9w8fmrpiLle
         nFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744694304; x=1745299104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7xAbEEI7p+I6WmGNc8jAy6i7DcwaAU5md+L6Ye5HR0=;
        b=saTymS0DlSGAhCEtcYTtZWSvW6cUzsYe/Y5WzlgEpNn7jQSS0WQkPzWg4b8cRbdt42
         AI8U5zlvU3j3Thagf3+oEbFtRz2kCnbxcQ6kV3EJOUS97bOZ7UiUZMWtdCPTaacRVgPa
         v6/fzb/M6RRl061zGBhtEHHFiElNaNp4k44waR2XvVSyfoaUPUt5rbNEwj35JsLEKwGy
         s1sbZqIVZPbD4RCFOHq7JQy42fQtTWnxXjJyWQYxBefuVFxhEc9JkyKtIOQGoSlZcyf3
         K77HaGqROEvOcWvsuzbOEq5OCZzxhEYXFEL2hcHyRSq+z6H36aW8xHbHFvsQzAFJ7blR
         KjZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5BxhB0HPSwWZlKHsUEtsm+LHRmCm3z3kha8Escg2kMkUlx3JkxalLW2fDNeTL0radAvv4FEc9Xg0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHjxbBe79RbCpuFZgbAtsn0rzh7p5zp6D+U2fozr5oVeO5R8+D
	f8m3GdFnQyhy/pKLivdNubko47vFqJ2xAZ1Ytk9IA0lLfstfbRrs
X-Gm-Gg: ASbGncsm6zi9ffH+XEysABa7mMDZPV2xs9NDMvEVujyeVng/RGknbjwIF8aODlUlmhc
	eC+qNg8R+4ZExbf7lzKaaaoU/PoKTPFnHwPdSCyaE/AadR3gWBdiNCkJPmYeNmyynSBHbN35/LT
	jiah/7cKwb1ytIvOOIFYYWYOFu6H3AbrnI/bQwllGbBW/bOATOLAzd0vsrRDAhLQFH4zZPs+Bqk
	MWKIPsgdlWXb0xcHYKUafEgTilMg23DnuQlEBHNUY8IxkoLfm7WC8hk93ePWIq1mGoE5M0Ub8Gn
	bDLH2KHyspTfL4K5wZK6hFNTGf7qr7eiuNbM8wC37bq7rlzRvEw=
X-Google-Smtp-Source: AGHT+IH7xJOWztV6diobC/t4okiPR8RXZE7KG/DFe4goD1duyxZyyWmFTs7+pxBBFdGZSO4RmQCe6w==
X-Received: by 2002:a17:90b:57e8:b0:2ee:ab29:1a63 with SMTP id 98e67ed59e1d1-30823624894mr19795024a91.3.1744694303996;
        Mon, 14 Apr 2025 22:18:23 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:400:be8d:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df4011e6sm12127760a91.44.2025.04.14.22.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 22:18:23 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v1 1/2] i3c: master: svc: Receive IBI requests in interrupt context
Date: Tue, 15 Apr 2025 13:18:07 +0800
Message-Id: <20250415051808.88091-2-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415051808.88091-1-yschu@nuvoton.com>
References: <20250415051808.88091-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_221825_114387_F49D92ED 
X-CRM114-Status: GOOD (  16.92  )
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

Moving the job from workqueue to ISR for two reasons.

1. Improve bus utilization.
If the requests are postponed to be received in the workqueue thread,
the SDA line remains low for a long time while the system loading is
high. During this period, the bus is not available for other targets
to raise requests.

2. Ensure prompt response to requests.
For timing-critical requests, the target may encouter a failure or the
event is missed if the request is not received in time.

IBI request is short, ISR can receive the data quickly and then queue a
work to handle it in the bottom half.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 85e16de208d3..7ceaf3ec45bb 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -201,7 +201,6 @@ struct svc_i3c_drvdata {
  * @addrs: Array containing the dynamic addresses of each attached device
  * @descs: Array of descriptors, one per attached device
  * @hj_work: Hot-join work
- * @ibi_work: IBI work
  * @irq: Main interrupt
  * @pclk: System clock
  * @fclk: Fast clock (bus)
@@ -229,7 +228,6 @@ struct svc_i3c_master {
 	u8 addrs[SVC_I3C_MAX_DEVS];
 	struct i3c_dev_desc *descs[SVC_I3C_MAX_DEVS];
 	struct work_struct hj_work;
-	struct work_struct ibi_work;
 	int irq;
 	struct clk *pclk;
 	struct clk *fclk;
@@ -487,9 +485,8 @@ static int svc_i3c_master_handle_ibi_won(struct svc_i3c_master *master, u32 msta
 	return ret;
 }
 
-static void svc_i3c_master_ibi_work(struct work_struct *work)
+static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
 {
-	struct svc_i3c_master *master = container_of(work, struct svc_i3c_master, ibi_work);
 	struct svc_i3c_i2c_dev_data *data;
 	unsigned int ibitype, ibiaddr;
 	struct i3c_dev_desc *dev;
@@ -504,7 +501,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 	 * schedule during the whole I3C transaction, otherwise, the I3C bus timeout may happen if
 	 * any irq or schedule happen during transaction.
 	 */
-	guard(spinlock_irqsave)(&master->xferqueue.lock);
+	guard(spinlock)(&master->xferqueue.lock);
 
 	/*
 	 * IBIWON may be set before SVC_I3C_MCTRL_REQUEST_AUTO_IBI, causing
@@ -530,7 +527,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 	if (ret) {
 		dev_err(master->dev, "Timeout when polling for IBIWON\n");
 		svc_i3c_master_emit_stop(master);
-		goto reenable_ibis;
+		return;
 	}
 
 	status = readl(master->regs + SVC_I3C_MSTATUS);
@@ -574,7 +571,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 
 		svc_i3c_master_emit_stop(master);
 
-		goto reenable_ibis;
+		return;
 	}
 
 	/* Handle the non critical tasks */
@@ -597,9 +594,6 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 	default:
 		break;
 	}
-
-reenable_ibis:
-	svc_i3c_master_enable_interrupts(master, SVC_I3C_MINT_SLVSTART);
 }
 
 static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
@@ -618,10 +612,12 @@ static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
 	    !SVC_I3C_MSTATUS_STATE_SLVREQ(active))
 		return IRQ_HANDLED;
 
-	svc_i3c_master_disable_interrupts(master);
-
-	/* Handle the interrupt in a non atomic context */
-	queue_work(master->base.wq, &master->ibi_work);
+	/*
+	 * The SDA line remains low until the request is processed.
+	 * Receive the request in the interrupt context to respond promptly
+	 * and restore the bus to idle state.
+	 */
+	svc_i3c_master_ibi_isr(master);
 
 	return IRQ_HANDLED;
 }
@@ -1947,7 +1943,6 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
 		return ret;
 
 	INIT_WORK(&master->hj_work, svc_i3c_master_hj_work);
-	INIT_WORK(&master->ibi_work, svc_i3c_master_ibi_work);
 	mutex_init(&master->lock);
 
 	ret = devm_request_irq(dev, master->irq, svc_i3c_master_irq_handler,
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
