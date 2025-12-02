Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAFED116F9
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Dec 2025 15:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/I5qgYtpJRmiuEOGms1Ty3xqG6FOKSaCCothtA4q5K4=; b=mDhD9jpm9kjCSq
	PYz0tpeGC/EnvaHDCkE6NWUSmf/0uV9o7QRaTv0WrGgDhBK3T9lumnC+QJ9e+JyIetqgLhMzVwF4V
	GkpgrQfyk6V80xjlpmMjzr7C6nRQ+3qYtkZt9GeDbsKzwRthyG0mcNowoWTjw/AUmAXIr5p0WKeoi
	UKkxcDpJt+mKif3iYtA/dcxAOG+NGBsU/tUDXyYDt9krQ5oSvek4JYlgk7ZndNxP1J4uLlwMS6dgG
	7L2ZOPe3Gx/wwi2hYHzoWsBcfw3A3Q6JhYLlYSm9R+aywCSYVA9vI2OlwfBHVBo50F4Iryl7xqyzx
	/S1s79x8vowdilt6YinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQSSL-00000005Z6H-1HNu;
	Tue, 02 Dec 2025 15:38:21 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQSSI-00000005Z5D-3BLB
	for linux-i3c@lists.infradead.org;
	Tue, 02 Dec 2025 15:38:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7DEAE1A1ED8;
	Tue,  2 Dec 2025 15:38:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 55482606D6;
	Tue,  2 Dec 2025 15:38:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0AF1D102F08E5;
	Tue,  2 Dec 2025 16:38:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764689895; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=VUDe5XVoUYzmn1Ml/QBYqYiy04e9d+UQcI+zQWAxNzA=;
	b=XVXRSgvcLiPoaUZU8uLxbaig//foPvOU6umpRrCymMj/QGSgcdUr0jLfdADdbEk0DhvDmu
	odDKlwOC6yI+u2DGXbdU1a48z3Lsmtk0sQqIdBKHeNDJmah7opOHu1A9m/0qGgb0fUFQdG
	EUjYbAsMkkRH5BqlpJ8+9xD57JmkpuyNZrdKPwM9zSeq2WjeUnwi/v5vHFHHYJu5XuNXo+
	15Iao1ztgm2elmtihZ3vMZ/UiadtuDtWnlzfj9WPQuBaArQISyYOlLaMrdYwKrgfLHOLi+
	sogzXRKjGxwgKyGloh/1u60NYMY6uK1JIfAgy1sd07d9D8qrBv8VE1PYWgK/kg==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] i3c: document i3c_xfers
Date: Tue,  2 Dec 2025 16:38:03 +0100
Message-ID: <20251202153804.2640623-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202153804.2640623-1-alexandre.belloni@bootlin.com>
References: <20251202153804.2640623-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_073818_929195_C0B8A43E 
X-CRM114-Status: GOOD (  10.70  )
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

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

i3c_xfers was left undocumented, document it.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 include/linux/i3c/master.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index d0d5b3a9049f..2fd850f4678b 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -418,7 +418,11 @@ struct i3c_bus {
  * @send_ccc_cmd: send a CCC command
  *		  This method is mandatory.
  * @priv_xfers: do one or several private I3C SDR transfers
- *		This method is mandatory.
+ *		This method is mandatory when i3c_xfers is not implemented. It
+ *		is deprecated.
+ * @i3c_xfers: do one or several I3C SDR or HDR transfers
+ *	       This method is mandatory when priv_xfers is not implemented but
+ *	       should be implemented instead of priv_xfers.
  * @attach_i2c_dev: called every time an I2C device is attached to the bus.
  *		    This is a good place to attach master controller specific
  *		    data to I2C devices.
-- 
2.52.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
