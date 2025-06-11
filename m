Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832F0C7EE33
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Jun 2025 00:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+wOyJLbEbmj6rmw+23PaC7nBPnChjXo1m99QPOqg+o=; b=NPbDU7EPxgwjHp
	zbg4rqxgh8sgcSKjDyuQLoFqyGpVr0UxP6NaZ7USdnCBJ/Clm6bgD1WlSULnxsWHiEpAeHqoIk+4E
	a/v0b4JkTIdwtwwfXjY65xYTMfN1noCgTG3YbLLhr9mgQBsJRUM7XaliTtS4yz4MWST56t4iDGpFc
	HPTY2kUHfAkQaR1PH20ciV5O/2eYcWBIItY0Wm1k51b4bVGy44CLzxu+9mue37bE7UVvw7/DJJvmd
	VpUsRXRC6HKOAIQw3WJATZgGxGe4mIL9dvKtNthbfxW9iKsdkEPUzWpZDmsR052LCdQKF76eqhhW3
	TF286D+YpAbnoDkbIuIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrYq-00000004Eho-15Ru;
	Tue, 24 Jun 2025 00:30:52 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGou-00000009Giu-2Lzm;
	Wed, 11 Jun 2025 08:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ahMwYnzAqR2ccux8pEM9neDBaxqHAvqHao7Hj/i4BgE=;
	b=cXeBc1fDyuCnOgI1P/kEJBnpW0hvRhbh+DUKSFrRLqp798QPGZtjWM+AleqnS4
	UdkB0yM0B0UpZBk9YL8Rbs0oTRvlDIO1pBFdLatlmPSDattVvdTbGkqcJedj5W18
	NobAAPqqAYTnn4oMeK9oYqLLdhK5J4UYwTCPYMCAaytbY=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgA3180UPkloM8lpAA--.43803S3;
	Wed, 11 Jun 2025 16:28:06 +0800 (CST)
Date: Wed, 11 Jun 2025 16:28:04 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: carlos.song@nxp.com
Cc: miquel.raynal@bootlin.com, Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	conor.culhane@silvaco.com, linux-i3c@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V4 3/3] arm64: dts: imx95: correct i3c node in imx95
Message-ID: <aEk+FEq+Ivj5wfVW@dragon>
References: <20250427083230.3325700-1-carlos.song@nxp.com>
 <20250427083230.3325700-4-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250427083230.3325700-4-carlos.song@nxp.com>
X-CM-TRANSID: Ms8vCgA3180UPkloM8lpAA--.43803S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOKsjUUUUU
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIBYBZmhJPhYL6gAA35
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_012828_946757_2AE07AEE 
X-CRM114-Status: UNSURE (   5.79  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 23 Jun 2025 15:46:42 -0700
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

On Sun, Apr 27, 2025 at 04:32:30PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> I.MX95 I3C only need two clocks so add clock fix. Add "nxp,imx95-i3c"
> compatible string for all imx95 i3c nodes.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

Applied, thanks!


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
