Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7484BC282EC
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Mar 2025 05:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FMkt0QK/n8lhDC5NhNAW1gpfvJIe53k/XoQ3K9pyhsA=; b=RanwgdSPS5S03E
	AF6qPJtztSOh20mwr2qbFR3Gz5S+LlCbeiX37u2ZQ9tbxWV33KCr5aLIrzBRyfV2GMcBS7DM325rv
	9qN8uEAUiFAf0EWXU0nYmEeYX3Xa8lAzir5fXp+gqYp3b63zvcxMJ7DwbB210FgQTv/P3XU1RrRKA
	TPYd1KlR7a0+DjzwHiKEzlwIhYVFkkQ9Q9MOca4k5m2YsyPh4w0mffPoIX1Y4+LfJjYNtiHx/eTfd
	cSpO4OHFWjkb0mLPgAnj6AQ2CC/NhzBTYs6g7N9I8nrQpcBcOnk/+YJs3eMR8kwSJjg2z/1/NXWXY
	tY7cf81Hd0bapgHTVZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuPdN-00000004jFc-10Yd;
	Tue, 18 Mar 2025 05:37:01 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuPdK-00000004jEx-33I7
	for linux-i3c@lists.infradead.org;
	Tue, 18 Mar 2025 05:36:59 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2239c066347so107901555ad.2
        for <linux-i3c@lists.infradead.org>; Mon, 17 Mar 2025 22:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742276218; x=1742881018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2l70gmWLq1u+RsRNabUWN7Xz1zqqPiMQOA3ywbVZDU=;
        b=IjOtPjaBn3N9CdU5oztEO0JTkomWGCRmC+Q0zRvbXvJ0cg1+l9X0kSQ2vwrfQqxp2D
         OAbPM0bfoZps70v12RLCYMzmYxPCrIcyvHkLiMtiIhOCKCCcP5nMlSnYuMYO6Sv1X2h0
         AUjSRsgreWpRY7mneGzYbOCR6DLKodcOiCcCUbSxW+UAllcbU6ALplWK7pil6HA4x0zY
         CA7eEjK8Ix6jhsbMSm0tUg2IsATQIW3gsDnxSi3HcRu3ifvD8A/m97c9MH9XdT+CCbGK
         0d+cHv2k1n88yZhuPIcAD7CdXtVeQap2R+z/Hf2l6QRCvO+KZs39jieTcr9wBSNUvqwS
         TEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742276218; x=1742881018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2l70gmWLq1u+RsRNabUWN7Xz1zqqPiMQOA3ywbVZDU=;
        b=jhrCrLC+KbUyq5yYt9JSP9zYR/HkzvNLXIv8r7iwhNzZk3KeaJyiVXNqdgopJO8cck
         JFlQKnxEHiLxRp/LEkDZKGCrKjdjO24UzAs9uU3tEcRdFRbD7Bs+IZwgtVBb32ylUAOM
         RponkYNO232VPYwc/jrz1N3FlHxwrLsXFpFPrzoFzE0LAbDkQy+7uahnJ+MSEwA2ClOM
         VsmjW2q9NPocp+OfF3mL95AuRK9JWAXXezm0NZJV19KY65j1yfEnE6FRABG5ScEiMc2u
         Y+gsZyNVvDHcCAwPosAUKCWGZWnF4Mmq70cZ44N7s2r9h5wtxQk7c+UlPOs8RKs+oDGz
         GrRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMh37IFAzV+lB0Cd/vmZcsRYmN1bVwpkGDr/tSPkZYD1OI7AI3OnNV7gP2XXMOHpwjqfV6t8X84aQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIZbQ5WAKYvjqO0VrGrxD+PsX35bLFeHNJRzl8SL92IMHV+bsG
	jn2ZTB1qAhMu0H/fViJapYiwh7Ncjp0iXCRVcEE+F/DrrljcuPWi
X-Gm-Gg: ASbGncve0GEvLuG4ykWKzeW+Xp9IBlFotrthF5RkScdO8Wg8OcYFv3ncnQ7NYFve/g/
	WFzx8EODEE+pyyZo5inqDVwJGvghwKq71HDHx3QU8XAymZCIbFPzz5kWGcIJ1puA2Bgp58x1Rxq
	+Mvsn9YvvfCRypQ7SQryOKp1qoA75WLHJyt56cFa5zrqgLDZPWkbbFupWmcg8ITmwXdyse1omVM
	JFMWk1ZnfG305fAbHCKUTNVu03PbVS80DpMB6cgcQB1d3o1v2fjW3zNovxIEkhct0tTt1/1BzP0
	ZSfQRc1QuWZPz5A3eWrlWUxkNzBG5K/0O3Z3fl7IarUZZYkHvNxTWpc=
X-Google-Smtp-Source: AGHT+IHh61jHEle2cIzLwjfMURMV6oyMDvmV3DsO5QwJwWAe5RRi+4NcIIvl2m8zXZrzfh21OGTCZA==
X-Received: by 2002:a17:902:e545:b0:224:2384:5b40 with SMTP id d9443c01a7336-225e0aa0c3fmr202843365ad.24.1742276217919;
        Mon, 17 Mar 2025 22:36:57 -0700 (PDT)
Received: from cs20-buildserver.lan ([2403:c300:dc02:2d2e:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6f09sm85299905ad.133.2025.03.17.22.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 22:36:57 -0700 (PDT)
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
Subject: [PATCH v2 3/3] i3c: master: svc: Fix missing STOP for master request
Date: Tue, 18 Mar 2025 13:36:06 +0800
Message-Id: <20250318053606.3087121-4-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318053606.3087121-1-yschu@nuvoton.com>
References: <20250318053606.3087121-1-yschu@nuvoton.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_223658_767226_5F20AF2A 
X-CRM114-Status: UNSURE (   9.03  )
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

The controller driver nacked the master request but didn't emit a
STOP to end the transaction. The driver shall refuse the unsupported
requests and return the controller state to IDLE by emitting a STOP.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 57b9dec6b5a8..e0cd3ce28b7f 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -592,6 +592,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 			queue_work(master->base.wq, &master->hj_work);
 		break;
 	case SVC_I3C_MSTATUS_IBITYPE_MASTER_REQUEST:
+		svc_i3c_master_emit_stop(master);
 	default:
 		break;
 	}
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
