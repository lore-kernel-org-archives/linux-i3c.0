Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794CACCD194
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Oct 2025 07:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JcIPFZyUxb1/Z5BQ6KOn5c35zWboiTwiGGdWjQVuzjI=; b=yKgCGxTrpcCpQk
	PSWc9P2jbOmuH06bjLT2hzub6g591ZG+V1NjnvP2MUroY72iZShT92FTvvgjk3GgUn64IEg32i3u+
	egrzjzck/T2tdWckjInWJrEU2mFhAwwNVXhysuu8sTjlHWPWwffjUOajf8vON15cK04zSxv27kbC/
	3enQeiy8HL3EdIBsgRBx5saXyYTDly/DMAghsNNPU2lBmEd3QgJEAefHwMODTwzcm8lM1dy0aWAGV
	LZqcpJC8jhqwD/33QTtKnomAUPgVC0RzKTsCAyduRUMS3o0ceqLEiX+HdEY+76XUa3RMjUaSi86Qx
	cQN4/mI9VmzurSgSwxMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9IYl-00000003mnS-13Zq;
	Thu, 16 Oct 2025 07:38:03 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9IYh-00000003mlZ-3AoM
	for linux-i3c@lists.infradead.org;
	Thu, 16 Oct 2025 07:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Gd3v
	OEz3/H0QA/38uI9tsC4yGi+xpW+XNdrIuSQvnmw=; b=hXClE1fAU+kSkVQvwfU3
	facxtvhnBaHmxgf0skpmfKC2v3Fe6GD5J9kbJT43o/kHOvjkzp14f7zviOBYhp2I
	MhbV0NQqvrZ27bFUurdVFebGQkADFG3Pn5HJzb35uqZNGa6gh+BJeN2LdTdDXzu+
	mAIEXccz7ycitVCRZOPBSan5cRlLbcj5ZyRegN0Uz+UAdCDh5FEY4AoYEQBAAQ18
	5NbhT1jkjyWFu+6w2wooo0uuXc2uzAsrUBFYrH8QZGogTekTKkojS4gGasZcvGCQ
	n0RKyNjjbHx3U0jgoiiO7i9eLa1Edmtnum8SBnNCd4qpfK+6fOhBtXk+paMa5Qeh
	EQ==
Received: (qmail 3710845 invoked from network); 16 Oct 2025 09:37:54 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Oct 2025 09:37:54 +0200
X-UD-Smtp-Session: l3s3148p1@6ZPssUFBTqwgAwDPXwQHAL/S9V79e5yL
Date: Thu, 16 Oct 2025 09:37:53 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: adrianhoyin.ng@altera.com, dinguyen@kernel.org, Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] i3c: dw: add option to disable runtime PM for
 DesignWare I3C controller
Message-ID: <aPCg0bFm4-DnmhAp@shikoro>
References: <22286d459959f2a153ac59d7da46794c0f495c77.1760579799.git.adrianhoyin.ng@altera.com>
 <20251016071051c3f647ce@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251016071051c3f647ce@mail.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_003800_068229_EF535EF1 
X-CRM114-Status: GOOD (  12.90  )
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


> > Add a new Kconfig option, DW_I3C_DISABLE_RUNTIME_PM, that allows
> > disabling all runtime power management (PM) operations for the
> > Synopsys DesignWare I3C controller. When this option is selected,
> > the driver skips all runtime PM calls such as pm_runtime_enable(),
> > pm_runtime_get(), and pm_runtime_put(), keeping the controller
> > permanently active.
> 
> While the quirk may make sense, it definitively can't be activated by a
> Kconfig option. This should rather be tied to a new compatible string or
> a property.

I wondered why this is a quirk, at all, and not default behaviour. Is it
because it works with some RPM implementations and not with others,
depending on the platform?

But even if that is the case, it might be worth to opt-in for power
management instead of opting-out for buggy behaviour. Because I would
not assume that IBI have been thoroughly tested when a new platform
using this driver gets upstream. So, the buggy behaviour may only be
recognized later. Or?


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
