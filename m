Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD553CA0FF7
	for <linux-i3c@archiver.kernel.org>; Fri, 29 Aug 2025 01:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ayhZNcpSTZCI79/im+YPtonHVrPCpxmA6cB+BUyNzYM=; b=e9rRDVU7+pWASp
	fy3Vp+ovBWGXA3r7s4u7poTlUo699o8rGNbvQ+LfoNXOo6T5nTddyTl6HcmSwxEQJ6mYSUMzjb0wS
	FrqidWbJPH4R+2wIJAQfHKptrfG562eUN47WgQ5RfLN6ceP25ZDRcb9JBLJbYwl3bAJbh93UA33Hc
	mblq1LVyxKD7591yRnRKqfqNSuWaOKfBTeAg0W1D6+i2d2v5dh2JVo93idAMtUQJZ9SUr97f5cE6j
	XN1XbXvx3stIF9YWSurRLOZZoFefuu35CgVAOpyBn6gUgzcwTfbBBMRvCAjAFPZiOnyNvl9NNrRvF
	ad62/O/DbGiTBduBujvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urnzR-000000041cD-1pnZ;
	Fri, 29 Aug 2025 01:33:17 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urnxI-000000041Ma-20vg
	for linux-i3c@lists.infradead.org;
	Fri, 29 Aug 2025 01:31:05 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-323266d6f57so1724436a91.0
        for <linux-i3c@lists.infradead.org>; Thu, 28 Aug 2025 18:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756431064; x=1757035864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/9pMLAzp+OJLv9QfGuHa4wnCkokVIs0cn0/wGFQPEU=;
        b=RknbAHTUCJzZnJamKbxNk6lsjg+Z9MiBtUulO7cHChr5+chjNqL265tzP5bbMpdkSq
         2Ikk20DlSP83AJz/ICtcl7zETBHAiwKwmFSZhJNdP4kUitewXW7LfQblGEQcbOSJeetN
         QP1L6MLJtS+O2LFhzZJgoHGTD4YH3ki16iKoWVX5sHRZUkJIHuPGnFKXUtEVJ/WDtSc0
         moFITshvm3mTbs8KB0Baw/hCd4UR56beiC7L/vtp7Oqpw012/AVHXEfYoTdUSYicAL+Z
         ky5t99+AclpX1tKmhclX8Cn2RLqSJBU5s6f1w7293XA4WF3virbPFEy6UdIT6O+cQ4fw
         GHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756431064; x=1757035864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/9pMLAzp+OJLv9QfGuHa4wnCkokVIs0cn0/wGFQPEU=;
        b=Azv1rWSDaDSlUN/f/ZwT12MmQoA6NbGEkNMTLg5RveAYY6Idmyc8UfyXHDR+fGQmGm
         cjeasgge1NYsOgbMxFAqms32VsfXuItXhSIptjIZj2X6QuFskVXvkTezCu9LlOfucOCS
         87xmJnFlHk2hdLxCbmTCTHljelsfweh4bac3EMBRne7b/LH+WprsOu4ufUlxBjJxqT6c
         lj0f9RAEyLPpBXA1hpk1MVHf8SSgkvvsk2RH4FtTxA6PNDeJRrjotx9NtmophK9w6mW5
         YwU1gHFmWgCzRpUekB9uWy48+S4d3dyFonpa3xvy1Ad5nUuddXCk0roMPyViiTvn7fW4
         M0Hw==
X-Forwarded-Encrypted: i=1; AJvYcCW3XLngZOzL++zNgUNQ3LGbYE14E9C9ZBvj6IXcYnuod0YM2G2b8EVBOFxabVae9lv6lRVHCXJZYzs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9Rw5xnqzoXy0lhv+kjiYOIU9OG3Rw0oVJwya2ev8BHl8geMb0
	uxQRZMlCyYswBWqjEagnYAJG5/CGvniWTzTqWqE1fUeC916FHtCtMp1D
X-Gm-Gg: ASbGncsIHlZTgK68BCNx0bm4TNwov4znnkh3kooG+qUl19j/I424MGYyi0e9t46xDG1
	WU3VxaGns500WXqi6JJVW9cYMADn00znPXxkbOB6DeAY6Gm4sJUtDhJhOtkT/QIU3lkVAr06BMf
	ntdPssH/CbJHc7yjSGYPm+grV6q26M21eNEFkWiRauyP+oPFkULH1D5tzD/w3vGipJK0RFUlAXl
	rIdoz//+odvAkuuAFrduGdvpAC3MjgwYfRz4zszXz8n5uboweFEgncExWs+UkAhJlEH07jMZCaz
	28GdOq/RhA3WbdJKSB7dL0b8CeoPKjNAXJGS1E1uHOxiugTcuRyRSSX+5nmYPbJb5/nl/QjUExE
	Vu+7vwLEgRUIlBowttxn+kzsRRaegbXCK
X-Google-Smtp-Source: AGHT+IFjrfeM+QC3JsYvq0XJQwzI7oSGwDWr+9yk1UjNgku6/8Ns5b588Q9STD2zyT0UUigxpZD7TQ==
X-Received: by 2002:a17:90b:3f87:b0:327:e781:3d2e with SMTP id 98e67ed59e1d1-327e7813ef0mr507446a91.33.1756431063645;
        Thu, 28 Aug 2025 18:31:03 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:500:7a9f:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327daeec552sm959977a91.27.2025.08.28.18.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 18:31:03 -0700 (PDT)
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
Subject: [RESEND PATCH v2 2/2] i3c: master: svc: Recycle unused IBI slot
Date: Fri, 29 Aug 2025 09:30:53 +0800
Message-Id: <20250829013053.3562853-3-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829013053.3562853-1-yschu@nuvoton.com>
References: <20250829013053.3562853-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_183104_513282_534F715A 
X-CRM114-Status: UNSURE (   8.73  )
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

From: Stanley Chu <yschu@nuvoton.com>

In svc_i3c_master_handle_ibi(), an IBI slot is fetched from the pool
to store the IBI payload. However, when an error condition is encountered,
the function returns without recycling the IBI slot, resulting in an IBI
slot leak.

Fixes: c85e209b799f ("i3c: master: svc: fix ibi may not return mandatory data byte")
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
Changes since v1:
 * Add Fixes tag
---
 drivers/i3c/master/svc-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 8e7b4ab919e3..9641e66a4e5f 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -417,6 +417,7 @@ static int svc_i3c_master_handle_ibi(struct svc_i3c_master *master,
 						SVC_I3C_MSTATUS_COMPLETE(val), 0, 1000);
 	if (ret) {
 		dev_err(master->dev, "Timeout when polling for COMPLETE\n");
+		i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
 		return ret;
 	}
 
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
