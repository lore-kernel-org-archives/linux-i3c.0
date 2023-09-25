Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BF0CE79A1
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Sep 2023 21:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vPBj/Pyi+FK3DdC/xo9xQO1KIq4iLQeUb5A5CqYBS2Q=; b=ldAb/XI4Bek3hV
	oFm2RRip2eq5NZyJlJQQ9+kWuIXLcK4SCSfw3Wm/3pX3shhgmGvzXoA8jB0VUcScikxo7KNIb89c3
	3+nYkeXb0qzwh1cAOPPr4RKc5f/GTrPBKNsT7A1y4XJPQIlAx1tf1cDf9VbG+hAlMp00Dbf78UP6U
	BXvWneTj8CcInIAdADxHhYAG2ZW85Rc9Lfi6WbFnzY0jIx3n7I3FTJMtGnl5S3wdvDPWnNJZTN8rY
	+LaNMLhPGkgcoUzA8dmNUZRwpFybsR6LYQs7253GiCZG+2ri1rOXmmnqsaIP2Zp4eXXf0Yr5tQ5Iv
	Wh6eQYUiHosBFJzluN2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qktG0-00F4On-1G;
	Mon, 25 Sep 2023 21:36:44 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qktFx-00F4Nn-2I
	for linux-i3c@lists.infradead.org;
	Mon, 25 Sep 2023 21:36:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2ACB260007;
	Mon, 25 Sep 2023 21:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695677798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zK2AYyS5AOi31YK4qNe9+ZL3iMbHjy0qxHStfnnY9To=;
	b=IpVwMo/jZcA6bL0LNhouiA7axhgCG84NHJcLXJZ1fg9WcoiobYjsiiUzODnbiZpggMlRRd
	3Z2moSnXvdUwfpbNLhakYZXW57LpE6Zc8F9tKLDW3CF9vhVmE+2K0fErfemjE6HBPAiFgh
	YvoKpte6cdLIV9hs4Y4hx73PCLaAwTZnCa0Po/cHDNFROdlPKGZeERHRYJ/+544Mn6GCHS
	31X642Feh7Jos4sFAGHVx1oN10p/NHq9CuHlxPDiqlaf6XsG9o99yHHwUxCeGdYW9EqXIg
	9FNxToeP0Y6Gz9sIN1BrZejtN3PbNcx99Qv+PirZ/RNCy72wpIl0FwrZVLM2Uw==
Date: Mon, 25 Sep 2023 23:36:36 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Justin Stitt <justinstitt@google.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] i3c: replace deprecated strncpy
Message-ID: <169567773733.243402.3288813289063152469.b4-ty@bootlin.com>
References: <20230921-strncpy-drivers-i3c-master-c-v1-1-9fdb8d8169e1@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230921-strncpy-drivers-i3c-master-c-v1-1-9fdb8d8169e1@google.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_143641_893809_80F51715 
X-CRM114-Status: UNSURE (   6.42  )
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


On Thu, 21 Sep 2023 03:51:04 +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> We expect adap->name to be NUL-terminated based on i2c_adapter name use:
> | dev_dbg(&adap->dev, "adapter [%s] registered\n", adap->name);
> 
> [...]

Applied, thanks!

[1/1] i3c: replace deprecated strncpy
      commit: fa7726a4d9b91e0a8fb6fbbd819cd20f116f6c21

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
