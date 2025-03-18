Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA15CC282EC
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Mar 2025 05:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3WIlqfMker9TN10I5zT3jEtWdpE9ZTEPZN6Xf4BkGM=; b=a6tnXDa9AHOF2Y
	5tyDMj1BnPswIaS12ZWjYCh+agun57z5lZTxj1KYSmiiqntj/KPyj+rMBEYx63yhVboFgKBgoOK39
	YsvoBdvJ/ptY33ugSKLnfxLZvHHzeqLSkEjAksdL2fO3JWc4ZOtImNQpuIUGEdXZAjF6xneYyUAoF
	Hk8MN6Pz+NXMev8heg3lzhNauaTmBq3L9CsJAXPWUw5SIvQoZnFEYoDZzjE1FlRum1wdB9cEzffMj
	CPHWC7whGyL1XU3qXWuihYHevz42ytIWj+yWn4rmi6IIESqCgKBOotLwnJbUrmqzp55uAUxSEEOss
	XoEa5h5IZLoDmdypRgJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuPdH-00000004jEI-31EY;
	Tue, 18 Mar 2025 05:36:55 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuPdF-00000004jDv-0m5o
	for linux-i3c@lists.infradead.org;
	Tue, 18 Mar 2025 05:36:54 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2260c91576aso31970245ad.3
        for <linux-i3c@lists.infradead.org>; Mon, 17 Mar 2025 22:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742276212; x=1742881012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rhPbDd0rp/+eHjWfo/oyKCU6wF9P8ggGmtlZyVMevo=;
        b=ayPGrsIpNWVECbN9EmOjsdDyjntZbHBq0aJ6QPZ2FDxQqXr90Lz4cm4xS7Spy/yhv7
         We8iBPfgjfh3EWydxI3Svk2AKpjhbTKPm4aJdtKfD0VMS3quHSBHo1BVTEuqsbV2iN/O
         dhbmAHrdSNAQ7U/qXURUehk3+mD5OJl9+ppKXo4xWrsGUkRlRyPoSjtdsMB4Loty3CfS
         0vwX6JbJTwJ/c2HghnmfqMOFx45GSN+tcviNUN+eHxA7FlOUgAFqPENR2udLetsa4b4N
         VzZIvFYgv1u9Xd5DEJ1w7CZUdSpCUqtqkLVymWE1zRzq7yBnnO6ikHIzS6U0yRgEopMn
         IjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742276212; x=1742881012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rhPbDd0rp/+eHjWfo/oyKCU6wF9P8ggGmtlZyVMevo=;
        b=Rd0mC9clS5bvL27fu2R6c1jXuwM0Oc7x7HeVv+Nur6pK3+mdki4wi9batYMLw43RwY
         weHpjX09eHqH3ugXvdNQYKHsl8N7ahktrC6aqUNASv3JW6mhIkZexrScYXVO9abzE9Qt
         aEuKRgSDpwanhpor1UygDwji5T5c5YlrLELb5BcrVp7a7pxZWMbiG3wD5148eJ4tEUcp
         BF50X6INJCSyABBZ3qFlZmWkWI6fxe0AMGeTmyFZ/1Cv3XaguWFfCkc/NRn4BI7NGtcs
         BgCWIb8v0pMbWWDtuRURPlkwbpaghJ33UBJnMeg06cRsaAc/1qUg36o67SBg+V9e7CP5
         PCwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrKs0cmcHEwUQL0KbmkAs8PNs0vofitfrgEP+QYVQ4AAE/zGEIelpvkDY6YsVE/kmhx7qzSOadUbI=@lists.infradead.org
X-Gm-Message-State: AOJu0YweiB3ZBnFQli5t72TcDXJC4iDV8UFPZmcVThzKIiK4vwjD+GHI
	ZwG0EXOFceVNqwmMkLVM00PtPZIFZBcshUfinDb6tzkEAnPW6wDx
X-Gm-Gg: ASbGnctf68YzV78qy7ZXW7+9trF7QBGEEb0erwcfawawE29jogR5YPNbDPOpR3aNvy0
	RenFemd3B01DugyL67Nni7uIGs4Dw6N/Dmxt6+mlTxEWzF0f3fVAp7zxtF6Yk4p/4ZgK9ZZWY46
	rqyOT4ZgTL95cg7HrkdGS5dfEtzSUzJqDmPuOEI6P6h3re6D9CpstSyGZBw8d3FDDyQfPbR/t/4
	E59q+KZKd+jB8kCXJP69Q1sAs+pb9xjnv50jkK8Srau9kjn6Hkdp322qVEYQG76fpjEltF8l+N0
	n+HdJcLnIjxq1Mpy5yLFueLY1fzI7p2Y0hq3HLRVe3A0uOPH6EA0anNtXdfr9tpU8w==
X-Google-Smtp-Source: AGHT+IEQ5Xvf+rbEz83j21PmQVZJa1tTQ+KrF/RyhHQ1rBe5bD51Nx04dUVCxZ5zSSVIrBohADEJzg==
X-Received: by 2002:a17:902:ef48:b0:221:85:f384 with SMTP id d9443c01a7336-225e0a3fbc1mr197525795ad.16.1742276212613;
        Mon, 17 Mar 2025 22:36:52 -0700 (PDT)
Received: from cs20-buildserver.lan ([2403:c300:dc02:2d2e:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6f09sm85299905ad.133.2025.03.17.22.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 22:36:52 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com,
	stable@kernel.org
Subject: [PATCH v2 2/3] i3c: master: svc: Use readsb helper for reading MDB
Date: Tue, 18 Mar 2025 13:36:05 +0800
Message-Id: <20250318053606.3087121-3-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318053606.3087121-1-yschu@nuvoton.com>
References: <20250318053606.3087121-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_223653_222596_3C518C84 
X-CRM114-Status: GOOD (  10.74  )
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

The target can send the MDB byte followed by additional data bytes.
The readl on MRDATAB reads one actual byte, but the readsl advances
the destination pointer by 4 bytes. This causes the subsequent payload
to be copied to wrong position in the destination buffer.

Cc: stable@kernel.org
Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index a72ba5a7edd4..57b9dec6b5a8 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -425,7 +425,7 @@ static int svc_i3c_master_handle_ibi(struct svc_i3c_master *master,
 	       slot->len < SVC_I3C_FIFO_SIZE) {
 		mdatactrl = readl(master->regs + SVC_I3C_MDATACTRL);
 		count = SVC_I3C_MDATACTRL_RXCOUNT(mdatactrl);
-		readsl(master->regs + SVC_I3C_MRDATAB, buf, count);
+		readsb(master->regs + SVC_I3C_MRDATAB, buf, count);
 		slot->len += count;
 		buf += count;
 	}
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
