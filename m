Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FC3C25B75
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2024 12:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=cq7pH5FmavtoJUb83b9/eb8/aW1TdoPlLIQm3/9I13A=; b=R/P
	OWHG8GFWke6kphlgPWdc6ItkwEL2cxecgJeHFCMR/saMRQVQsNDiB68kQAxU3JeucFjWYzsyz/CWo
	dEx6F0ycW6V1bdU6E0bFISFYSrbhdsUaPDub3+Zo/PE3KGwxSWx/qEayBpWHH9/iPju1iLsohoNQv
	c1gHYr2fBJFikTFFIQFFWISdxTNICzZdla7BThOWXIcvxcCZBV/jqoRZ66yX0BZAxckYxGiPXBBl1
	5XQTFJBX3HyZSwGi00hWQ6XDyTzKFsFXkWQ1aGUfcAMnpTigWn03IdL03t+Q9L0xWKusgr/Gvo7Xk
	cz5SmTASnuMbXKCwBGvZ6sTk6XmL3Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFCXh-00000009kL3-1RdO;
	Thu, 06 Jun 2024 12:48:33 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFCXe-00000009kJW-051b
	for linux-i3c@lists.infradead.org;
	Thu, 06 Jun 2024 12:48:31 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-629638f1cb0so13333577b3.3
        for <linux-i3c@lists.infradead.org>; Thu, 06 Jun 2024 05:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717678105; x=1718282905; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FNMGfW18oepz3ctHxT2v/fTJlvcIHvl0RqDaCUUXgSw=;
        b=3DAkcHwPutyikhvP7/A1zFxv/7/btktdE11ABvO565p0MJTT06m9lDlWQCSFQ1vWal
         /4rFnhwAFeoh9s/EG/OsRVIGL+MlvTazc+3Ko0HyFs142sUJsISmhJx1O77wyeqojSvt
         /OtOsSEZyjxA7PGmiLZpnpnfTZV0/MUuIP+fIQqgDv5BK6F0X5iwwYps0MTdB3nL15cj
         YT42wl6Es9Fe4eQE9hWaXI9d6Pio5kvu7w7JzVmBsjMJs0BS9dwfH/dCh1+zUAZ9BnnE
         moLgRyN8LKbVGlWbng7WzeTUu08dxaMy4xNNt8cj4n9hdkzmoK2qvvooX4KijZf6pEkm
         bE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717678105; x=1718282905;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FNMGfW18oepz3ctHxT2v/fTJlvcIHvl0RqDaCUUXgSw=;
        b=quryN8HnjUy6NjQCu7/la4pmYMhNaarUnYrm457lHPafMzo8COMsVsDs8646XvcwQw
         iqoCHqd4HqV+xMVPwD7/xldDSEanDDtVyaV0t+smwQw3Lm+JRQsY2pySwHnZ49NMdXMa
         soMJV8cqrYqrCIntmdiEQCNT2lVdPxLLPxdK0EyQmTnrB2bmP2AozVFdRpBbEHmkT6BI
         jo12ZHyhVe7SOHXFSjjNbSA+fpzRqzuAbK4+LZ4PCS+ZdphiY1DBTREYH0z1MVAvTXY7
         aVKB/E9Wsw/wA08EuO/1UmWNPwP78z12C+gmASfcHPVAWW+8EdCud5MEQrjK5nHCJ3t2
         kNHg==
X-Gm-Message-State: AOJu0YycqAJu4ch94eLxFohPvbdIzrQ+NPg14HU/OM5k0qWULVe8M7Ek
	eDmmSNqt7ttSrZCHBVsq/I8hWZKqtUnnVWGDNi6+H5FkUJgCVWpNEaxutPCbfVPNcf553VXAS5L
	19pBeNftZoHh54aIgXwDG0Nf+vQ==
X-Google-Smtp-Source: AGHT+IGyFFTFa03GCHnZkv1BAA0sPoC1f/yGvtDNotGuIKgkWBUvrfNZqbo7e1nX4X50u55/G66XwMCRh6p0RnlOAn8=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a25:6851:0:b0:dfa:5cb2:fb1 with SMTP
 id 3f1490d57ef6-dfacab1f6cdmr189986276.2.1717678104783; Thu, 06 Jun 2024
 05:48:24 -0700 (PDT)
Date: Thu,  6 Jun 2024 12:48:16 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240606124816.723630-1-aniketmaurya@google.com>
Subject: [PATCH] i3c: dw: Fix IBI intr signal programming
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_054830_084409_0E3224AB 
X-CRM114-Status: GOOD (  11.99  )
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

IBI_SIR_REQ_REJECT register is not present if the IP
has IC_HAS_IBI_DATA = 1 set. So don't rely on this
register to program IBI intr signals.
Instead use a simple counter to do the job. The counter
is protected by spinlock.

Signed-off-by: Aniket <aniketmaurya@google.com>
---
 drivers/i3c/master/dw-i3c-master.c | 4 ++--
 drivers/i3c/master/dw-i3c-master.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 0ec00e644bd4..08f3ef000206 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1177,13 +1177,13 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
 
 	reg = readl(master->regs + IBI_SIR_REQ_REJECT);
 	if (enable) {
-		global = reg == 0xffffffff;
+		global = !master->sir_en_cnt++;
 		reg &= ~BIT(idx);
 	} else {
 		bool hj_rejected = !!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_HOT_JOIN_NACK);
 
 		reg |= BIT(idx);
-		global = (reg == 0xffffffff) && hj_rejected;
+		global = (!--master->sir_en_cnt) && hj_rejected;
 	}
 	writel(reg, master->regs + IBI_SIR_REQ_REJECT);
 
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index 4ab94aa72252..44a5f045f007 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -39,7 +39,7 @@ struct dw_i3c_master {
 	char version[5];
 	char type[5];
 	bool ibi_capable;
-
+	u8 sir_en_cnt;
 	/*
 	 * Per-device hardware data, used to manage the device address table
 	 * (DAT)
-- 
2.45.1.467.gbab1589fc0-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
