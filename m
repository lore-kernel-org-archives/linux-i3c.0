Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9460CC02193
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Feb 2025 16:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FNxVQd0GodW38A/+KaAJ5O+buHKT9p5rKTWEFtaCskI=; b=D1PcoDW7ah/PkK
	iqdlSLFVR6+ByTQ1ad1GdNhRD938JhfkHoTsW6Xph3ItilbCbqzLFECyauDoTRB4HK3Pnd4uTXElo
	Kh3BDtE1/uyhTMyNaMEEHC9Ea6QHc4GYqENCIdbLs/uh3XOZ8Ak6IseRjovmDRA+3VaK73o34lZ3j
	CuD5aL/oRs8tmrO9wX/KhR9eWF5VP2Aor8PoiUJvarVQdNN9grINmajNR1jPXDPJiA0HC9KJLMKDc
	VSqGk1gjEoUZ/A2QsywIGqyjiESxMaIdARcuoTy/mD7ZmAmY84BSWsxqtTUUrfSSsB6QhEMbg329X
	gCrllSHD5qKaToey4AVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMBE-000000010wh-11op;
	Tue, 04 Feb 2025 16:53:44 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMAn-000000010tX-1Li7
	for linux-i3c@lists.infradead.org;
	Tue, 04 Feb 2025 16:53:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3C484441A;
	Tue,  4 Feb 2025 16:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738687994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f+OvLiwkQU/mpsy3LgRWkbcH6X4OVk3ux+0IaLCu6C0=;
	b=hdZdDn9janfgCi4eILWQUVF4Ieiexly8RrAd5y9jSV7cugQmm7bqD+tXmbOtH40KcCHeQa
	g2lbGyEA9CHABtLZFaY9GHTo5AXUClfkdaKSa7rYDqzAumsskOtCLBmB9A4XZEuorCbqM4
	jW/QHn//kfksbXdmjbCO+FOKma5ZVZRG2tP9QpdoyRWw2iIKsRPO223TOy/uxmeVMrrH9A
	QZ7Peplj7kzIi7EmHZ2Bqyzmztr70w/yTIPyE3/wkj0X32DXXY5CEnLfUR3JIOxi9ezMAB
	4Z9IaWrrFpVOWxiD3ZYb6x4dgYjl0xeWlzLJM2WlYn/CcXwaq+UXV92k0Fm25g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com,  conor.culhane@silvaco.com,
  imx@lists.linux.dev,  linux-i3c@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] MAINTAINERS: I3C: Remove Conor Culhane from Silvaco
 driver maintainer
In-Reply-To: <20250204161151.2179596-1-Frank.Li@nxp.com> (Frank Li's message
	of "Tue, 4 Feb 2025 11:11:51 -0500")
References: <20250204161151.2179596-1-Frank.Li@nxp.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 04 Feb 2025 17:53:12 +0100
Message-ID: <877c658xdz.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgesthdtredttdertdenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeghffgleeuffdujeevgeehkeefudetgfefueelkeehgeehhedtffdtfedtffeiteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghonhhorhdrtghulhhhrghnvgesshhilhhvrggtohdrtghomhdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhug
 idqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_085317_508490_7D2D4977 
X-CRM114-Status: UNSURE (   5.86  )
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

On 04/02/2025 at 11:11:51 -05, Frank Li <Frank.Li@nxp.com> wrote:

> Conor Culhane's email address (conor.culhane@silvaco.com) is no longer
> accessible, and there has been no activity from him on
> https://lore.kernel.org/linux-i3c/ in the past two years.
>
> To avoid email delivery failure messages when sending patches to the I3C
> mailing list, remove him from the Maintainers section and move him to the
> credits.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
