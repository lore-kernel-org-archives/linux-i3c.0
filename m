Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D7AD1171B
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Dec 2025 17:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t+Hc8cNSNrPcK1ZpmjTwN9Qnp46hadFlWXzCvrYxYrE=; b=kxURf83ObUUjhZ
	d3+fWxabulEF/x5/4OIkY0U2POV0lkDDh1QG+HUVd7aODG/2TFPk1nYMK86s3301XZJFe54xTZBq5
	i+4tiK8rBvEzjpyo7u+/mEKLmuQfc38ItDXprnkzMkHJiGL3iLsBudWuiW12ZVoBrNqHi6FnyjZpB
	IWE0i9N2qbFziQBrebBk7Hvdd7vrS4ApcAC+hMUHBGQy/8AWJ2pe0fGp+Up6f3KueXGTtDGqZyYVa
	2NpiGp50PsVzHGLEWPnUY4qModMTiIU6PJ6FXHqQTMgxHi1ijLFtOdtFvUXBBaCdkJ99omXnjk5LI
	wiLkIDGd0Wc6vsjrwGbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTqJ-00000005eef-19eY;
	Tue, 02 Dec 2025 17:07:11 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTqF-00000005eeI-3Yia
	for linux-i3c@lists.infradead.org;
	Tue, 02 Dec 2025 17:07:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1803B4E419E0;
	Tue,  2 Dec 2025 17:07:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D17E1606D6;
	Tue,  2 Dec 2025 17:07:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93B7411919D70;
	Tue,  2 Dec 2025 18:07:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764695224; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=mUNwn26nhwJCke2bRYWKHCmVtw4daBaVjxTywqqyjAE=;
	b=wGL+W5WArWvIH0qjuEPIh7lBBWL0xGThHbRSi8PlsOy1Fx9wh5KAPX7185UE9UnXeyatVI
	tB02U6b2VRqZNRD6aIQCYlklOBO5ZI55m9ZlerXwmVyOwCObRjeQg5bUggCVmRVIqRYaIK
	M7z6qgos1oxmkfCkXyK6M6F8+qEBTi74dxHfOyRPLGICON1olLjtd+3ZTISudDfzAuiciq
	HuTdr5NPWMtOpuZ7u9W+w0J/Dn2AIoDlXK53Oml0tt9OvjWgjgYpAZjOvsZ7Nc9uvSoumT
	D602TJrR84hTK8vXtJDgrNLviL+Duo9/sSlpGXwX3njvC4ZRxyGsAfRcoFqisg==
Date: Tue, 2 Dec 2025 18:06:59 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 0/4] i3c: switch to use switch to use i3c_xfer from
 i3c_priv_xfer
Message-ID: <176469517228.2676946.6008057547804596817.b4-ty@bootlin.com>
References: <20251028-lm75-v1-0-9bf88989c49c@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251028-lm75-v1-0-9bf88989c49c@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_090708_044110_C985E4A5 
X-CRM114-Status: GOOD (  10.02  )
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

On Tue, 28 Oct 2025 10:57:51 -0400, Frank Li wrote:
> This depend on the serise
> https://lore.kernel.org/linux-i3c/20251028-i3c_ddr-v8-0-795ded2db8c2@nxp.com/T/#t
> 
> Convert all existed i3c consumer to new API.
> 
> The below patch need be applied after other patch applied to avoid build
> break.
>   i3c: drop i3c_priv_xfer and i3c_device_do_priv_xfers()
> 
> [...]

Applied, thanks!

[1/4] hwmon: (lm75): switch to use i3c_xfer from i3c_priv_xfer
      https://git.kernel.org/abelloni/c/1f08a91cec5f
[2/4] net: mctp i3c: switch to use i3c_xfer from i3c_priv_xfer
      https://git.kernel.org/abelloni/c/57c4011d3637
[3/4] regmap: i3c: switch to use i3c_xfer from i3c_priv_xfer
      https://git.kernel.org/abelloni/c/79c3ae7ada05

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
