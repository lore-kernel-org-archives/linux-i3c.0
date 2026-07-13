Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106E5C44501
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Jul 2026 13:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Wkfi5+eip+pX5vDsZX7qZaBqSIVO6EVJRyc2kor9wg=; b=QimJk5N7GFzucu
	86wSez9sk9uPwqHTe0M3P0cMRicGhj+EMn9EeLEHWlWeY9Z/OEQWXHhOVwd/Y42fkd6i64qG04Kyb
	jK8DzewmY2Jy0Oh00M7dmUFfKMisCYqPuSaLarDHryay5STDbXVkhi572u58y4gRr8PlK0WxhXVjk
	6JNN9dC1XBD3BNzyewEXVaa8IYwj7j446DWqaxECM43JbZGnvJ8St8jiKHqs/18dLCo1/lqmKrY0A
	UwLQS+7qY0ehaeSfQW26YWJAqk+zekLAgrLTXf5W4jcLruHVp+M5y21qayBqH6Ktn4vZ2WN7nARiV
	UzBszGN8HWF7hKr2rjBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMI-00000009Jmf-3Vp9;
	Mon, 13 Jul 2026 13:06:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGMG-00000009JkZ-3wWl
	for linux-i3c@lists.infradead.org;
	Mon, 13 Jul 2026 13:06:06 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493e497643fso18736095e9.0
        for <linux-i3c@lists.infradead.org>; Mon, 13 Jul 2026 06:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783947963; x=1784552763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0uLPM+01Tsv/yEFxBZFkTxOO3Vsml2pOVlgqkzc7WeY=;
        b=JPRqVQZG7B2bHhmM9h+dD7/8ueLjLqfDODyTekL4GNTgTkBpQFimV6Zau/QHEMnAs1
         M3t8psMbhtiq2ES9qe1Fj4a4ZMSLQ6BdssqfSRqlAlZqzzzQWQ8Cg1uYI+g5zTHYjznX
         jcRgUcOeuDdnXSkY44Yd1dqfHC/5xVco2Ylqbo7DaOqGQxTjmN0NDNdHm3SeOKNEGLGy
         qRWoGYi4bZcWkr7fsO0fIIZfjRW+FI7F+p9hul6yJD18E1hmqkdcHVPsANy/8uNIOFok
         fBX3aN2t9PAedz0YE3ZzEKGg8W5Cl93QdEj71Bgfaezc35bS/+LGAlyfonCAY8ctvvU/
         WA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947963; x=1784552763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0uLPM+01Tsv/yEFxBZFkTxOO3Vsml2pOVlgqkzc7WeY=;
        b=GJzqQQpfJElFw+EzZ020MfH4kYWuY0ZHzV6Ow/pxBf6cdnqtWzaH16boifQ8HWgY32
         M58Vcm6CdrebVomfaR0mG8AQmpHEXoKLESnFVRNvRS6eZ2eMKGjJxbp00mjrYrDAoXwq
         w+N3ob7xd7IN/M6PbJktZb69/53ClEssaEtojm1RKSJVz9RW44rCHdcyqzTJ4Tr32S21
         Qx4JTiD3wrjWx7kPTdpmjd7wSM5t8YnpBbNmHt4HNOEFD4v7Jn4aFmcdUfcp4eHS842m
         AbGgXwAyDubByZMS3k8lU1coDgS4jmEzcbHvMZvM9gJzz7OgeLlaDnjoohwjN9cmiO/I
         taIw==
X-Forwarded-Encrypted: i=1; AHgh+Rryzy/q4EkvDTax68YvJ1j9bL7t8qI56udoOUuWCBgiyzjF7m9HmD1qSTBjp25qGi45JekuvWmhUWM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw42JnySv7vOxm1HS+zEQ7eO5vwkNlEqI2ReKJs3wG6GMQyhh9X
	QSyVYRGdpAzQFSu11LcjqtSO+jC9hzm/o1/3uFIN7I5lT8/LqnnXX1UqB6I2a7XqoRw=
X-Gm-Gg: AfdE7cmOpoCjEv/1abUEIVztDIp7SbzRWDprgODbXq1rL1alA4WppF97H5YCkvOlLoS
	uoFvqRZVZlzeRFP513TKnOTke3u7QfFJ5K1unzzhUqPs8TnhHumuE+mufo3gXwi6bI65ic4DClz
	p9JKE8a1WmEuXOAjthiCDm3EutRkWbs64FXCk75OKxnzEY/rtSo/hVKRxpveKvfhJKXcJjhWHde
	vlGjV19pTdNnCYUDDL6oGl19iBsR/VwHWLpYfYChnW6QQ3EGvdCvE64BkaPD0ahfm1Db/pMFHb1
	0kDiKN3yjf5pqLpR69N/ucjdbIpBjPMow4CN+VyXv2jLnqLluw+Dbf4AA+pu6380YLCFvwQiAtO
	YHaczOpG37kAeZrRiwBKr4ygxMLiMjp7ZEsFXzV+Cd2IEIXRLpbxvKQGAPIvKQDgr5cStOwzTRq
	2FFKqmu6E2R+Xy7aVAUGcSxggKX6bZfUbvwzGC0yOPyTm5WbYwXKHRYaoCKS2F/G2bC6yJZmQ=
X-Received: by 2002:a05:600c:a40c:b0:493:ee4d:5c5d with SMTP id 5b1f17b1804b1-493f882cb8cmr64144385e9.31.1783947963058;
        Mon, 13 Jul 2026 06:06:03 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm25321609f8f.3.2026.07.13.06.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:06:02 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 08/17] i3c: renesas: Fix out-of-bounds access for newdevs mask
Date: Mon, 13 Jul 2026 16:05:36 +0300
Message-ID: <20260713130545.568657-9-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060605_024809_80502D92 
X-CRM114-Status: GOOD (  11.09  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

When software initiates DAA (Dynamic Address Assignment), the controller
reports the result via the NRSPQP (Normal Response Queue Port Register).
The data length field of the response descriptor, which is accessible
through the NRSPQP register, indicates the number of devices remaining
after DAA. Consequently, when the bus is empty, this field contains the
maximum number of devices supported by the controller (8 for the Renesas
I3C controller).

Adjust the condition that computes the newly discovered devices bitmask
to prevent an out-of-bounds when the I3C bus is empty.

Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none; this patch is new

 drivers/i3c/master/renesas-i3c.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index b9784d238f61..c459e40fd5ff 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -703,7 +703,11 @@ static int renesas_i3c_daa(struct i3c_master_controller *m)
 
 	renesas_i3c_wait_xfer(i3c, xfer);
 
-	newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
+	if (cmd->rx_count >= i3c->maxdevs)
+		newdevs = 0;
+	else
+		newdevs = GENMASK(i3c->maxdevs - cmd->rx_count - 1, 0);
+
 	newdevs &= ~olddevs;
 
 	for (pos = 0; pos < i3c->maxdevs; pos++) {
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
