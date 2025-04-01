Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23626C36008
	for <linux-i3c@archiver.kernel.org>; Tue,  1 Apr 2025 06:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ytN55SCc8caVQYmyAE/leu4HPm/t3sHuX7p0GrOSkGo=; b=x3v7ouuUVdTHZF
	e4JYtlPxL2pJ16ERqgqR8dtocZJo6RuAAcYEWOg9pYK9bPxC8XxcJc/Xqv3TTaH67wzt0XF0h0pCV
	sQFqZDA6GQi/qdyUALhNJfzOILE8nW4RaJA1xKli9+PyzsEqu6y39SZxptm5ZUFwtt62ANfFRjtKl
	aYjcNsbonkUEuv6QG+KCLtzAw8czpDYZQgArNOpkKXcqCuRALrCcW6BP3RcHZTpHZQ1HanPAk4IrH
	7tLSEI6QA+priC62watENUlYRkxzSgCGQWRsPewNiWjtNZgv3slZweP9JOpNYs6lHMRG2tpbzB9/a
	zEfkoMjwxF5bc+bQSrow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzVCc-000000026gs-30fe;
	Tue, 01 Apr 2025 06:34:26 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzVCZ-000000026gH-1iTD
	for linux-i3c@lists.infradead.org;
	Tue, 01 Apr 2025 06:34:24 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-227914acd20so93178485ad.1
        for <linux-i3c@lists.infradead.org>; Mon, 31 Mar 2025 23:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743489262; x=1744094062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFeN50Tct7m9TPsMIMcX8t/ayiqPwYq+pDcIP7/ikWY=;
        b=OqOZGvXvc3u3hJ5nb3TN2BrLFuTFCVc3K02ZDzIi02z2TMM8G5xTMTlWKL+dde1xdJ
         Jku5XBbK2FABWug3JrdL8ael6GVynJ1y1+kBZi1Emjt5aFBOELCEK+BGUrWBkUY6Z/wE
         x8ps9A7M72Nb6aVZUSsdC8CqfVWD91WatYsBeB/Eslr5gPQCQJxIMNQos6G09rDN4sPZ
         wxCFfGK9QY9uhwZtN2zgxEYYEE/fqXG5Brt8vcuspN2T5fM8phM67cetodz5ZdYrCxLP
         60qoRywSjZL68y33Jo/dFceZEKjlNzdIbgmsMH8XKME0lAckEstUu9+PDmd+bLcHST9Z
         g8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743489262; x=1744094062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFeN50Tct7m9TPsMIMcX8t/ayiqPwYq+pDcIP7/ikWY=;
        b=ksj2nmhcXkXfkqSRmQrSu6CPq+fHXC5nzMVFLoU5hUreQhqGSWVdgOxCUqmrkDp5m9
         D1P7mr597W8qDgTp+xX3EtLKnZyA7vb5SLfC4kBcHbWNvQSWgbqZxfpTcccqi9sHMDyP
         //3W+vW/FnwHmkylHs3LXIzCIpydXDsIxPtWR5fkxHA6opBMkKaST3wmIGn3tzr7vY2d
         3DrcYuXZH4TbqWt8hu7lhVVDWyhDkwESEXD3TYES1yR/4swjje+uBn5GRd3V8Oj1XwQ3
         YhN9E7B56R3vpQm1InT7T2Sqy+t8aVN2jh6mQmZPzjm9c2+y1bh8UMHiYqs62j0QE2Nx
         UHig==
X-Forwarded-Encrypted: i=1; AJvYcCXJOtO37woAyRuJx92pbxDd9AH4DMQ6G85Ys9i/aenM6stIw3GwAbbV1MAjywR24M/fC/Y1Z8w0+7A=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsmRvfKTxzzdynPt0dv5BDdz8PvEWyN6tRnaM4xANWW0Lb5e9M
	CatCwMu+QPYdYdpmywrbt6UVuGO/w/jSQU9TJkzd1Vxt94MG36do
X-Gm-Gg: ASbGncv0Cc0cQRhMjLjoB79carj8/18ZugOSUBFsorUmkf6ntdbBv7DmanoVxJDc/A+
	7GyRpyjBmBPsfaVFPp673agHCa7L1LFhV2UgNohE1VFyNBmawzD04RBm+inZ83v1pQtdPYuDUFI
	BsB9/NqJCFMFNPSdn/8ptlVr3Dw5wy6hHj6VqGwOLlUyjNgRNP7n29ghk2Nuegjgzf5I73VI+uT
	7ooZgMLPBKkkAbOb2xC93nXDRYPAMvRjx2sJLFnaReO2mwlY3Iq94r8xcui+KN4sgS/Bs8FouKG
	BqCDQ0W8F9h1Ago9PuaEtu/1dHJOeY2iVIE1SiWeJbOwqLWcB7KNZhY=
X-Google-Smtp-Source: AGHT+IEoQzp2h4CGT78zFhacjN0ZepZnshpdoJ5ahAWiyhTV/wanOTdKOOHVq2/eHxMD0YYhpAmJeQ==
X-Received: by 2002:a05:6a20:7fa7:b0:1ee:ab52:b8cc with SMTP id adf61e73a8af0-1feb5d3a07amr23490613637.21.1743489261961;
        Mon, 31 Mar 2025 23:34:21 -0700 (PDT)
Received: from cs20-buildserver.lan ([2403:c300:5c0c:4075:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b6a1719sm7396609a12.32.2025.03.31.23.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 23:34:21 -0700 (PDT)
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
Subject: [PATCH v1] i3c: master: svc: Update actual read length
Date: Tue,  1 Apr 2025 14:34:06 +0800
Message-Id: <20250401063406.3728534-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_233423_450652_52C612A3 
X-CRM114-Status: GOOD (  11.37  )
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

Some drivers, such as mctp-i3c.c, reuse the i3c_priv_xfer.len as
the actual read len. Therefore, the controller driver should also
update the i3c_priv_xfer.len after the read transfer is completed.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 85e16de208d3..dd520f5d4c9f 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1470,9 +1470,16 @@ static void svc_i3c_master_start_xfer_locked(struct svc_i3c_master *master)
 					  cmd->len, &cmd->actual_len,
 					  cmd->continued);
 		/* cmd->xfer is NULL if I2C or CCC transfer */
-		if (cmd->xfer)
+		if (cmd->xfer) {
 			cmd->xfer->actual_len = cmd->actual_len;
 
+			/*
+			 * Some i3c drivers reuse i3c_priv_xfer.len as
+			 * the actual read length.
+			 */
+			cmd->xfer->len = cmd->actual_len;
+		}
+
 		if (ret)
 			break;
 	}
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
