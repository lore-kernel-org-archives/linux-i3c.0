Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91939C48285
	for <linux-i3c@archiver.kernel.org>; Sat, 27 Jan 2024 19:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HAGP1uwg+fnnQamfYrnT30jozKCdk+IWBNzFhCOvRcs=; b=VSKdiBF1KDrNUw
	GFBOxC8JSnnq0w+cEnBB6q7XzIhmnN5QzSh0SANNWzAtNBCQvN+1Y34ttVFi3fUKKaEgXluKOhWKA
	qda5N6fhyZaBRQJlDG2CKcKAXVQko2dcgp8WNm8FVX5BQYd9lKhG0fWN9v2tYFwszCb4U/q7xzTJp
	Iz5CalBZsY0Sn63h78cLwESypXu6cEXwFVTfn0A+d3A3deOoMnoKhiHGIwSrJHccqrmAT2rXiIHzq
	Xj7EcfhAvIp9zxFtbzOG3jtzff2hDa1H3PT+VCkpxzw/ct2zsJxNG3fkbIpXZ7AcVHXxhebRUDJD5
	dg8n5C4cX9YrvBHg4Kqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTojb-000000087tX-00cr;
	Sat, 27 Jan 2024 19:52:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSeFt-003fjR-11
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jan 2024 14:29:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD89261D5E;
	Wed, 24 Jan 2024 14:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA14C43142;
	Wed, 24 Jan 2024 14:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706106568;
	bh=yw5VLAu6HaIrKQU2W0638c2aTqRWEALE65CVfbIVBI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aGuHu9NIlyjAKN8UN4GjZPEtHIajhqxbhGKc0MvICm1xomtdaX1dRF7KDHEAGXJ+2
	 ewEYMSzBfAOT/YThxVNGakvgv3f79aavqTt9Cyy4/jLBmlHLA27vQE5l/tsWOypRL1
	 KBQuUshhW2Cblpyp7V6sRpzs9GmrDUVWj49lwxwdHzPFDEHJrm0SVBTuIhhIzlWSD1
	 yBAUajjzA5OloqsyDXjBBhCDaiIgdQhKgkNHcqdk2BLogR+H779iZlve8ThIp/MWM9
	 jHp+6BRWLE9YY5CJMxgu74oS61JA77rALqbHRLCn3BiPGnpaIlCEpsqTqNpiHc4Faf
	 /VDNVnL0Ub07g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Harshit Shah <harshitshah.opendev@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	pgaj@cadence.com,
	linux-i3c@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 07/11] i3c: master: cdns: Update maximum prescaler value for i2c clock
Date: Wed, 24 Jan 2024 09:28:50 -0500
Message-ID: <20240124142907.1283546-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124142907.1283546-1-sashal@kernel.org>
References: <20240124142907.1283546-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_062929_395008_8A570CB1 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sat, 27 Jan 2024 11:52:56 -0800
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

From: Harshit Shah <harshitshah.opendev@gmail.com>

[ Upstream commit 374c13f9080a1b9835a5ed3e7bea93cf8e2dc262 ]

As per the Cadence IP document fixed the I2C clock divider value limit from
16 bits instead of 10 bits. Without this change setting up the I2C clock to
low frequencies will not work as the prescaler value might be greater than
10 bit number.

I3C clock divider value is 10 bits only. Updating the macro names for both.

Signed-off-by: Harshit Shah <harshitshah.opendev@gmail.com>
Link: https://lore.kernel.org/r/1703927483-28682-1-git-send-email-harshitshah.opendev@gmail.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i3c/master/i3c-master-cdns.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 8f1fda3c7ac5..fa5aaaf44618 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -76,7 +76,8 @@
 #define PRESCL_CTRL0			0x14
 #define PRESCL_CTRL0_I2C(x)		((x) << 16)
 #define PRESCL_CTRL0_I3C(x)		(x)
-#define PRESCL_CTRL0_MAX		GENMASK(9, 0)
+#define PRESCL_CTRL0_I3C_MAX		GENMASK(9, 0)
+#define PRESCL_CTRL0_I2C_MAX		GENMASK(15, 0)
 
 #define PRESCL_CTRL1			0x18
 #define PRESCL_CTRL1_PP_LOW_MASK	GENMASK(15, 8)
@@ -1233,7 +1234,7 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
 		return -EINVAL;
 
 	pres = DIV_ROUND_UP(sysclk_rate, (bus->scl_rate.i3c * 4)) - 1;
-	if (pres > PRESCL_CTRL0_MAX)
+	if (pres > PRESCL_CTRL0_I3C_MAX)
 		return -ERANGE;
 
 	bus->scl_rate.i3c = sysclk_rate / ((pres + 1) * 4);
@@ -1246,7 +1247,7 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
 	max_i2cfreq = bus->scl_rate.i2c;
 
 	pres = (sysclk_rate / (max_i2cfreq * 5)) - 1;
-	if (pres > PRESCL_CTRL0_MAX)
+	if (pres > PRESCL_CTRL0_I2C_MAX)
 		return -ERANGE;
 
 	bus->scl_rate.i2c = sysclk_rate / ((pres + 1) * 5);
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
