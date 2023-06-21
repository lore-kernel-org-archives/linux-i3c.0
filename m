Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4327AEB64D9
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Jun 2023 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uaOyrWEX8n58ULgGTjnBiv1BUIaXvNIba7Mg/OGHZDg=; b=v4v14L15+VvBem
	NTHmnwtbANHkV3rs1pBWRliA8ou0RiURFpcAvxlRJIhMZueec290GF9mY/bQLirIfblp+ywSPwXW2
	EWGsIl6S2IQWTJ6j7Cj1cuxtTL6FQSNb9Yben5RMeA0e3SMuBHeMvnVF7t2xq3CDm7krb3H2vvGl+
	zH5YNMjd61sOgJelj23Me6UW2ejDw6uJwV8PTiwwzcmEZI4GbfUtSuy71ebAWgFmAvql0tDo7CmU5
	uk6QmwvjUVgXn8hbIJykFzYvPeMnP1Bh9+ZkGFnjckl4MUpK1xIlEhJ80iN7nDrK5uHPTtPllqW/N
	z9En1ZQaDO9errRFy9ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEohq-000fpU-2S;
	Thu, 29 Jun 2023 10:16:54 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC0Z3-00F45y-1Y
	for linux-i3c@lists.infradead.org;
	Wed, 21 Jun 2023 16:20:14 +0000
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qC0Yx-0016iZ-Av; Wed, 21 Jun 2023 17:20:07 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
	(envelope-from <ben@rainbowdash>)
	id 1qC0Yx-001z4S-0H;
	Wed, 21 Jun 2023 17:20:07 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alexandre.belloni@bootlin.com
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC 1/5] i3c: show error with node for invalid reg property
Date: Wed, 21 Jun 2023 17:20:01 +0100
Message-Id: <20230621162005.473049-2-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621162005.473049-1-ben.dooks@codethink.co.uk>
References: <20230621162005.473049-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_092013_516465_36869E7B 
X-CRM114-Status: GOOD (  12.44  )
X-Mailman-Approved-At: Thu, 29 Jun 2023 03:16:50 -0700
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

When adding i3c devices via fdt, it is useful to get an error if the
reg node is wrong (say, you thought it was an i2c device and only
needed one value here) and have the error show the OF node which was
the cause of the problem (in case of many devices in the system),

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/i3c/master.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 08aeb69a7800..559fc2781a81 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2094,8 +2094,10 @@ static int of_i3c_master_add_dev(struct i3c_master_controller *master,
 		return -EINVAL;
 
 	ret = of_property_read_u32_array(node, "reg", reg, ARRAY_SIZE(reg));
-	if (ret)
+	if (ret) {
+		dev_err(&master->dev, "%pOF: invalid reg property", node);
 		return ret;
+	}
 
 	/*
 	 * The manufacturer ID can't be 0. If reg[1] == 0 that means we're
-- 
2.40.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
