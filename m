Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D7FC47074
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jan 2024 00:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWS6Vuxc/Vc0sbupcWmNdbaOuZ+LmR9nY/9AZaqcDp0=; b=vuYXTIzkI82rfV
	nUToCjZ42smtow+uKWUJEzX4zjDNvUlCvE5Su6WaWGItXNbrWBO6IXsNQ4oTl2W7NgRxua8ydpqpu
	UNTFfuOHcLH1kJVHSyN68ADgZjvBje6d5vm8la1TzDSgbXNsi1NRPrAdpmax26AUmLJ4I4mjpLhuE
	x7G8eNu/wVWi3qSHn+JrqOlM8QhZmxebViFR22owuJzcweTjErd8uUfVt1SLlcwEbTzbCZZgX7nOs
	FSiTK40f7XPoyBl3A/XMxp7QRcaWXmxWFSsQotHV2nZNQYugzURxSYiXX3RYyXztfc5SATYV7dNpI
	GereK0tVGyzkuK9+zcmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMd7t-003jvL-0A;
	Mon, 08 Jan 2024 00:04:21 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMd7p-003jsh-2R
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jan 2024 00:04:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 645A21BF205;
	Mon,  8 Jan 2024 00:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704672254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tdf5Xfn2/DCKkUk8uXbKkMEcVB0zckMLmQU1nw+lsO8=;
	b=RNhJCiaBPBd2SrPwPb2Zwt0QbmP1O7VhzophmpmegyJ/N/mYJkN8558X1yPtXrnw9WLnWK
	0XCn+MmD1JapvUOrWE4IpiqObWKLDoxSfO97HOYKaoIHTR2TRxhSHGN7bgpluALz7Fu0Ww
	xZSCT5YMiiVruM/10YOzy01Yy19ukJwsxaZ3sDVUa7vtK+zK67Y16BJn4oOJji86yyAYWJ
	nC8kkb+MF4WCyyBxISCSOg1P74W04HtZDHqwuHGsO/l7OvIwkpWWYtI/EB74Ei5JriwvmV
	EuT/j+YjIw6JjSPuQzTF2w1j1YoijRGusf8lXqKpLcRZbAXhyChv2v1t5ZP08A==
Date: Mon, 8 Jan 2024 01:04:13 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: master: fix Excess kernel-doc description warning
Message-ID: <170467220283.558820.13127608286872037848.b4-ty@bootlin.com>
References: <20231223050542.13930-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231223050542.13930-1-rdunlap@infradead.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_160417_954650_D8A87E38 
X-CRM114-Status: UNSURE (   5.85  )
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


On Fri, 22 Dec 2023 21:05:42 -0800, Randy Dunlap wrote:
> Remove the @boardinfo: line to prevent the kernel-doc warning:
> 
> include/linux/i3c/master.h:98: warning: Excess struct member 'boardinfo' description in 'i2c_dev_desc'
> 
> 

Applied, thanks!

[1/1] i3c: master: fix Excess kernel-doc description warning
      commit: 18e5794879905a788e06fb2bc40b6f5b58eae5c2

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
