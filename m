Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA548C47074
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jan 2024 00:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7BRhlVPbd6owfagFGoypeZlXQmwg73ckMotuWvCo/Q=; b=OFkSg7Yb0uD4/0
	ZlzezR/3kzCGb1RmwA19zE6vrjtEP+zzMmCSYfTvJZ0q6ElDEc7ZyxaFtQMfTswsXpwtKQ9HGtiVZ
	yE4Wp7VbJbt/0EuYQzvQD2KJ8+DPiAapPRWL5chMqygJeNgG8n5fsvg0XDx9KcBceM/hR2zJw4mWN
	1HbWxbQFlCng2egUZF3dcfJNVWpJvDXFNBnEW4jRllzYmLzZl41vahIX+zdHL+JPqbwqYDBe+lwaw
	hxt9ce5ZBOdr9K6/TxxlX+oXsLMy0IFhKxnyPY0PoPxPcIoiQl6pusKtPIqRC88Gusdu2uAQ4JIlv
	PtYtE0/wm4C59FYOpxRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMd7j-003jrI-1N;
	Mon, 08 Jan 2024 00:04:11 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMd7f-003jpT-23
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jan 2024 00:04:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1E47C0002;
	Mon,  8 Jan 2024 00:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704672244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eg4ZK/4xRof4C62MEDOAspYaJdjduto++dnlzUfFY3U=;
	b=E3c5M++3pyZznVbBRuHbNyAa4O2MEbwB7JLXIrrfxSvY62D6kipm54Sn0tFbRmvZ/fDx7E
	3YANJyw9K39oRIS9Q0BZHDoaa/SNndLm26j3YW6zW2yxDnefVqcRYv+7vP/bf8NS/ASiRJ
	lHo9M5ixmRsZ/w3JdxroUPgWXLO4NpbIav+zhmEfeAgM+uxi9+DKqVCCaHnUtEXgn6dWJE
	GkpRrQRrYCXxpvPAxbYSBlAM+FYPTs2oJa9vdjPVyj6/meYi4O3Iocw1CkgoP0gZbCdmrJ
	SQErILPUUNV2ADJnZs8dGNkiwGH+MM5BqLu6QC/oePlda7gEqjaCliwIizpiWA==
Date: Mon, 8 Jan 2024 01:04:02 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: pgaj@cadence.com, Harshit Shah <harshitshah.opendev@gmail.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: cdns: Update maximum prescaler value for
 i2c clock
Message-ID: <170467220284.558820.9894090612605026533.b4-ty@bootlin.com>
References: <1703927483-28682-1-git-send-email-harshitshah.opendev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1703927483-28682-1-git-send-email-harshitshah.opendev@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_160407_805700_A8B68596 
X-CRM114-Status: UNSURE (   7.88  )
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


On Sat, 30 Dec 2023 14:41:23 +0530, Harshit Shah wrote:
> As per the Cadence IP document fixed the I2C clock divider value limit from
> 16 bits instead of 10 bits. Without this change setting up the I2C clock to
> low frequencies will not work as the prescaler value might be greater than
> 10 bit number.
> 
> I3C clock divider value is 10 bits only. Updating the macro names for both.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: cdns: Update maximum prescaler value for i2c clock
      commit: 374c13f9080a1b9835a5ed3e7bea93cf8e2dc262

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
