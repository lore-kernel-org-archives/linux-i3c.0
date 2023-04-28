Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E17C77B73
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Apr 2023 00:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZxTJVESVqcKG9xALmo44wr34j7JNVnEN8xyHeE84nss=; b=0Y0Ukqn7p6qeYN
	aMZrcl2tOd9OZOyYSOxzyQ1QMYtc4R+YbqcB64e4i67xHJ5vMioEmOGkXtSLjZUD5pMWliDorhLlI
	u0CwNW5Y5RS2ut/wKTKy3iA4IE2istit9PzrS/s/4p+6W8WNwmOq1LLpAY9U+RyH6N/Ix7si2iUFA
	2jb/KQTn/A/urCb8h22Q+V2C3Us+qgZ2q7YWpbpgDEZf7XeO57MZCkmewUcvXKRi25gD6aHwgjBYR
	36YCbsHuHaqZ4Gs4GAhiAk8zb1pt+sMtQm2Td5ud36eAOgAQfDvkcyMFsNPfPoskzznzH1wl5nP6n
	B8436VwahEZceF07Eecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psBpM-007r63-2q;
	Fri, 28 Apr 2023 00:19:08 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psBpJ-007r5c-12
	for linux-i3c@lists.infradead.org;
	Fri, 28 Apr 2023 00:19:06 +0000
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 7D34020033; Fri, 28 Apr 2023 08:19:03 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1682641143;
	bh=fy6j7QTC5Ks9NmwtQOx67XMtj/fzPgFyg3vzYT4a8C4=;
	h=From:To:Cc:Subject:Date;
	b=TPAKhEyrCxwdyDKv8I0mhIiT5PXaIfbrv+ZORL7h0kLckpQaVmBB5bHFU2bpM1MiB
	 hbRNVk2nWIZ1Vgbp6UQqGbtU1imyejH33O9KOYQk7WS7XSYZ9RN99s/bBoZrfY7jbo
	 +h9VjBUnvAPo1I/HkOuGfBPQ3EJOkMMgJ/XmgT8BkgQYd6Ji2ZlBkWzfqGyZhhR6Is
	 QoZLQTP82CvN0jsDnE9Njp6uUsBTZTOBET/31DcOi0bL4oTRBgN4l6E9WE74Uq+Vri
	 jXqOPVoXJcPv70wxburxh23oDbR3/AHrFyBnKkw3Kd53dPzi95F3sPsu8zhRhvYJNC
	 Spb7rR8DIq0oQ==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Cc: Matt Johnston <matt@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Lukwinski Zbigniew <zbigniew.lukwinski@linux.intel.com>
Subject: [PATCH] i3c: ast2600: fix register setting for 545 ohm pullups
Date: Fri, 28 Apr 2023 08:18:49 +0800
Message-Id: <20230428001849.1775559-1-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_171905_559935_11A5ACA3 
X-CRM114-Status: UNSURE (   9.08  )
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

The 2k register setting is zero, OR-ing it in doesn't parallel the 2k
and 750 ohm pullups. We need a separate value for the 545 ohm setting.

Reported-by: Lukwinski Zbigniew <zbigniew.lukwinski@linux.intel.com>
Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
 drivers/i3c/master/ast2600-i3c-master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/ast2600-i3c-master.c b/drivers/i3c/master/ast2600-i3c-master.c
index b3f0fe1e63c3..d9af7b1cf878 100644
--- a/drivers/i3c/master/ast2600-i3c-master.c
+++ b/drivers/i3c/master/ast2600-i3c-master.c
@@ -21,6 +21,7 @@
 #define AST2600_I3CG_REG0_SDA_PULLUP_EN_MASK	GENMASK(29, 28)
 #define AST2600_I3CG_REG0_SDA_PULLUP_EN_2K	(0x0 << 28)
 #define AST2600_I3CG_REG0_SDA_PULLUP_EN_750	(0x2 << 28)
+#define AST2600_I3CG_REG0_SDA_PULLUP_EN_545	(0x3 << 28)
 
 #define AST2600_I3CG_REG1_I2C_MODE		BIT(0)
 #define AST2600_I3CG_REG1_TEST_MODE		BIT(1)
@@ -60,8 +61,7 @@ static int ast2600_i3c_pullup_to_reg(unsigned int ohms, u32 *regp)
 		reg = AST2600_I3CG_REG0_SDA_PULLUP_EN_750;
 		break;
 	case 545:
-		reg = AST2600_I3CG_REG0_SDA_PULLUP_EN_2K |
-			AST2600_I3CG_REG0_SDA_PULLUP_EN_750;
+		reg = AST2600_I3CG_REG0_SDA_PULLUP_EN_545;
 		break;
 	default:
 		return -EINVAL;
-- 
2.39.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
