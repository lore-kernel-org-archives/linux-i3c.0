Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA46BC27C78
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2024 22:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Qy40aB0pP0pSivLuW1kqeyfr6FtTyvWmpQKpsNCuJ4=; b=aeRh7ghuffOXvX
	QXTQyZCMS1JjuFWKqL09qkGaLMMMdIrBxl+onOjG5DGOuvZIppdMM0N19amXyZBXsh3lRlqxZE/fq
	OWTI+PkbHZ5aV8U5ZM+nPxTiz70Bmgy065f35MV90GwUVCQBb2IVcBxZsqNlqagUmV2oIN66BrYCP
	U3gRkxKyYWpEuVc82HW4DToIo0mvUpRFWZBIPVa6LRzqI3Gh07va5r433i+nLoDioZBQKmFCatqME
	6MQvGow0RoAqpZfn+MNbHf5X50CS+4F+DS1U+8iMgoPmrSF+AK4qYJr9jGLaN7MUqT3pvOauMFV/+
	55fLcvDfwP5T8THXCXYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL9J8-0000000Cvm1-1rH8;
	Sat, 22 Jun 2024 22:34:06 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL9J5-0000000CvkM-1VB4
	for linux-i3c@lists.infradead.org;
	Sat, 22 Jun 2024 22:34:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 675F31BF203;
	Sat, 22 Jun 2024 22:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719095641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZgFWJS2IRsrEQYnSwEJOI9RPmtNPLLE8Zp84vCIF7Qc=;
	b=TsUUcctjjWpLSlMbJbrCHr7KBW6ag6FR/+akiXJRz0QI7figAFddKfDyPfHjnRDWE5yvy0
	PnE26Bc3wrKjNqwJkm9VhwNjEkDpVFfkFT7LCg5iK8jodRzsyE6fJRGXyuapiCjQikUWjs
	L7S7DoNCB4XoEyzhMdy1T1PqlKO9IuUO3oM7/JopS+h8Q837hXxg032bjIOgHlhQBDeL5W
	vy/P/xdaybtfczrshFFmL/Rn/cwf6V9BwONZIqo9fcohVFxadcEeSsL0zmO/KW2qPOoA2c
	brco/FT0LME5HVqYyq0ZI05eDrXoY8Zl0x8nzMHb+u7UvMjFqzRRhqlqi54AsA==
Date: Sun, 23 Jun 2024 00:34:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: stable@vger.kernel.org
Subject: Re: [PATCH] i3c: mipi-i3c-hci: Fix number of DAT/DCT entries for HCI
 versions < 1.1
Message-ID: <171909557751.2164405.18080145631407814648.b4-ty@bootlin.com>
References: <20240614140208.1100914-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240614140208.1100914-1-jarkko.nikula@linux.intel.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_153403_588948_AE6A96F6 
X-CRM114-Status: UNSURE (   7.45  )
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

On Fri, 14 Jun 2024 17:02:08 +0300, Jarkko Nikula wrote:
> I was wrong about the TABLE_SIZE field description in the
> commit 0676bfebf576 ("i3c: mipi-i3c-hci: Fix DAT/DCT entry sizes").
> 
> For the MIPI I3C HCI versions 1.0 and earlier the TABLE_SIZE field in
> the registers DAT_SECTION_OFFSET and DCT_SECTION_OFFSET is indeed defined
> in DWORDs and not number of entries like it is defined in later versions.
> 
> [...]

Applied, thanks!

[1/1] i3c: mipi-i3c-hci: Fix number of DAT/DCT entries for HCI versions < 1.1
      https://git.kernel.org/abelloni/c/17bebfeab08b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
