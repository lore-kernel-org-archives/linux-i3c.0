Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F40C87FCA
	for <linux-i3c@archiver.kernel.org>; Thu,  7 Aug 2025 20:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=libGsSzNzcB5sGeVdjsGTiMGoal78JFQj/u75CHMzic=; b=cmSiH/75YeeMfF
	fV93CZ1C6SaS0P/HNmBLE3YTQ3Eg72oVuDU9PUIjLRgQFJIKCEthXijV3KduAazKouQ8cDd74cFf5
	whOu17Cg3wK9kFI/C85NR4Qbq7RO1Qaq2BOKndqUPybKFQxEi2MYfnscL+cw7IN2pJG3ybySEo0Sr
	KUGXmz7jlMkR1CTzLNSCq6arOvKr7RTtNfI3tlpKSXs4PeOY8q2z4YUd2uvnYtY4nSUlPoEHMX8hu
	cL3UiZbuKdvnlNjogCEddPTDyJXUrjUFtHrDMhKYcyn7C4NnA7wgqYp2SyWj+Q7aeweXZtL8h2Nr+
	wjJsD8pl2YwjbWc0JX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk77b-00000001TmP-0XdV;
	Thu, 07 Aug 2025 20:21:55 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk77X-00000001TkW-1rbr
	for linux-i3c@lists.infradead.org;
	Thu, 07 Aug 2025 20:21:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15C8544369;
	Thu,  7 Aug 2025 20:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754598106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fzalCYw2na9KY0FHYqIxf5tZkPW5UaHRqpyCgMjgDrw=;
	b=IOLqSjqHHqPAdp5okV+hl1oKaLuNgpO+acKT+QM81kpigrRHjMJQ6UR3b7D8+YbqcaflDt
	SVwYKdzWrF5U+Wan6+YShaU5nt/CiScFCtOc1eARVUbtZBjAuqJfwaMfIv7+vW/QWd82lL
	/FSSgSYw/HPQNQmLIpeAn5HoMf62pbSHVnrfgg927QGV08mWtHM/ettyIFAliwTq3eax2F
	wV2rbCz2dMDfMnr01CJ6aUALct3MEO4IoiKR/BY8kUzShR5QvywM953XwekjCEvx5lj7/+
	osIKx9fwxg3iYnfFINvVAx9harzSb7jbmU809D219yh/OoSGz3dss21be7fv0A==
Date: Thu, 7 Aug 2025 22:21:42 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>, Frank Li <Frank.Li@nxp.com>,
	Jorge Marques <jorge.marques@analog.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: remove 'const' from FIFO helpers
Message-ID: <2025080720214218750df5@mail.local>
References: <20250807043456.1624-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250807043456.1624-2-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvddukeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepkedurddvvddtrdelfedrudegleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekuddrvddvtddrleefrddugeelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtohhmpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtohepjhhorhhgvgdrmhgrrhhquhgvshesrghnrghlohhgrdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_132152_278236_FE1D5915 
X-CRM114-Status: GOOD (  17.73  )
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

On 07/08/2025 06:31:24+0200, Wolfram Sang wrote:
> As buildbot reports, some architectures do not want const pointers.
> 
> Fixes: 733b439375b4 ("i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508070438.TZZA3f2S-lkp@intel.com/
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> I still wonder why SPARC discards the const but since nobody seems to be
> commenting on that, I guess the fastest way to get the build error out
> of Linus' tree is to adapt the usage in I3C.
> 

My plan was to let sparc people handle their mess, there is no reason
const should be discarded.

>  drivers/i3c/internals.h | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> index 0d857cc68cc5..2b0b9c3a9131 100644
> --- a/drivers/i3c/internals.h
> +++ b/drivers/i3c/internals.h
> @@ -30,8 +30,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev);
>   * @buf: Pointer to the data bytes to write
>   * @nbytes: Number of bytes to write
>   */
> -static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
> -				   int nbytes)
> +static inline void i3c_writel_fifo(void __iomem *addr, void *buf, int nbytes)
>  {
>  	writesl(addr, buf, nbytes / 4);
>  	if (nbytes & 3) {
> @@ -48,8 +47,7 @@ static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
>   * @buf: Pointer to the buffer to store read bytes
>   * @nbytes: Number of bytes to read
>   */
> -static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
> -				  int nbytes)
> +static inline void i3c_readl_fifo(void __iomem *addr, void *buf, int nbytes)
>  {
>  	readsl(addr, buf, nbytes / 4);
>  	if (nbytes & 3) {
> -- 
> 2.47.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
