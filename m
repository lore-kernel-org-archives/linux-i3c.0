Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9C5CDB474
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 13:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVKeQqNJQ+blW3bODSI1WP3ez9q6eQNkyWeGWSk26zk=; b=H0SM9qGWc0mfDE
	xc/FzEptfGNqkZpjVKJjniho6p2lagsnYV64U48SLHh8UBHWf+XCz0zmOxLXnwE+ctJaaafHrv6nc
	3JS6ulN4eUf72HiTFtgAHMXpro2OwXvGUif8aDQdmEAuPrkDleZGZGS6udCUBl2J27GYwDEImg6b4
	ersyzLiif3kBXsgAhEIm/+zt/Xb225lT+vKHKCdleyW0PNy4Knl3wJaSh5HQ5sm9EwlRMVntoQ/zs
	sedSyOOV59/d4Rh/3U2eVXr+7al5YRUBzhRCWikSiZTDZ4Pi4zbVpE1Bl+lh9gy6SqWwtdf9mqGdj
	nKU0bjvo5D8+zpNBrqTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjm0-00CLcF-21;
	Tue, 17 Oct 2023 13:06:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qshoH-00C9Ll-0O
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 11:00:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81AF461388;
	Tue, 17 Oct 2023 11:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43575C433CA;
	Tue, 17 Oct 2023 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697540424;
	bh=+ylqmAC9HYbVfV5ircd/gmKrlKKR9WueEkigtzn6t+I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=F3dl12SZiD3NMsA2CPJPYiMt5SpeEa/lPUH/v2kyJlGUgenNzx1vMJeJd141RF4kD
	 3PmeRve8Aar/sdlRGakAq3Ovu9JuXRtLjP/bp2Irc1W6DP7lZha+7jRDjc37+PduTP
	 szf6k2SbcU9TgV+pS/H7/BLU3ycFdDi5/kGp1vWs8uff0aONLr2N0SiZZzI7bjAttV
	 HO5lIC8qdCnrzLHPkJpMOYnb1pG/f3NwE3rR7i+cwl6PUgBPErNGodIMmVObuXjVpd
	 sUf5UAwPanNYFqd0Ti/jPKWExeBOrD8cvGNXFtEcy7xGvKKDxAsq+FJ7bjHkXTcBsR
	 MBHjDROpidkdA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2D757C04E24;
	Tue, 17 Oct 2023 11:00:24 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next v6 0/3] I3C MCTP net driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169754042417.23145.5070726957751164458.git-patchwork-notify@kernel.org>
Date: Tue, 17 Oct 2023 11:00:24 +0000
References: <20231013040628.354323-1-matt@codeconstruct.com.au>
In-Reply-To: <20231013040628.354323-1-matt@codeconstruct.com.au>
To: Matt Johnston <matt@codeconstruct.com.au>
Cc: linux-i3c@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, edumazet@google.com, jk@codeconstruct.com.au,
 alexandre.belloni@bootlin.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_040025_215664_F9EE92D4 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 17 Oct 2023 06:06:10 -0700
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

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 13 Oct 2023 12:06:22 +0800 you wrote:
> This series adds an I3C transport for the kernel's MCTP network
> protocol. MCTP is a communication protocol between system components
> (BMCs, drives, NICs etc), with higher level protocols such as NVMe-MI or
> PLDM built on top of it (in userspace). It runs over various transports
> such as I2C, PCIe, or I3C.
> 
> The mctp-i3c driver follows a similar approach to the kernel's existing
> mctp-i2c driver, creating a "mctpi3cX" network interface for each
> numbered I3C bus. Busses opt in to support by adding a "mctp-controller"
> property to the devicetree:
> 
> [...]

Here is the summary with links:
  - [net-next,v6,1/3] dt-bindings: i3c: Add mctp-controller property
    https://git.kernel.org/netdev/net-next/c/ee71d6d5f18b
  - [net-next,v6,2/3] i3c: Add support for bus enumeration & notification
    https://git.kernel.org/netdev/net-next/c/0ac6486e5cbd
  - [net-next,v6,3/3] mctp i3c: MCTP I3C driver
    https://git.kernel.org/netdev/net-next/c/c8755b29b58e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
