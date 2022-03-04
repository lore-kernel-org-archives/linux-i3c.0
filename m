Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39DBC433F5
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Mar 2022 10:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J5+tjCcCgPSUt+36so6avXu1Xjqayo9875WlUNFJid4=; b=halQeX34NBxisL
	EyLbaKDSdQLUI43ygLe4T5Cy8AXmQMV0WEh5yjAidY2qKi4vSq/cWJV9SK1jy6Gm1tbGW5Fhackt/
	8kURzDIsee6cYwh1Fau00nQCMsa0Pz6sM+gHkhWbVJ/Hk7dkC9aO1NHdgjwmhscjOA55vBJqYEh3a
	weHqDYET2AZ+TazpCyBN3gTo1CsQiT87qhYrnXdKdB1mYiCHBeH329GfA2P7p2aeJP9sKIACyiuTU
	W0hO25H11LeMzczHyFYH7vKKuNelWUkcdg04O/4G8aP8pJY8h7U2iEUDMQUfYEXjWMWmT0jj//rBi
	3p3srOWWNIU5zRz5wCPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ5I7-009br1-2I; Fri, 04 Mar 2022 10:36:07 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ5I3-009bq9-MY
 for linux-i3c@lists.infradead.org; Fri, 04 Mar 2022 10:36:05 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 754551C000F;
 Fri,  4 Mar 2022 10:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646390159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QWrQWa+sb+1JNNiqnt5M+loepT4i+U0+VC1LiXu9Xi0=;
 b=Vf8X7qkTfYBz5bUj8NU86zDczzVZuyEoaqFqhAXX91zmxfPu20avSUQ1pa7iHlaqnSIT7h
 ESh1edbTp+zIgTzAr5rL2NlaQ2v1e3lXDKBVUaNFOCbSB7fALgR68NqiS4KV0w7WFu66YX
 qSzIbnkTRtDy4NUy2LL49J8c0Mt7NVvOYfn23+d38iTUh8ZMWW7YU9RdTG4KiuyF8C4xwy
 C01u0/RS2EnjYph1rEIEzwt641fJFRI/h1XolNsxwievFYvwfmll1crqj3OrALrSZU/CEh
 wxMNu1BmWNY9XRjjfl0vmf79WGocDe8vnRNdca/95dNtGPGN1204U/luiOjxmg==
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Jamie Iles <quic_jiles@quicinc.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 0/2] i3c: support for dynamically added i2c devices
Date: Fri,  4 Mar 2022 11:35:54 +0100
Message-Id: <164639013739.20219.13627775120905663769.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220117174816.1963463-1-quic_jiles@quicinc.com>
References: <20220117174816.1963463-1-quic_jiles@quicinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_023603_897805_B535ABF9 
X-CRM114-Status: UNSURE (   8.18  )
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

On Mon, 17 Jan 2022 17:48:14 +0000, Jamie Iles wrote:
> Devices are currently added at controller initialization time with
> boardinfo, but the i2c subsystem also supports dynamically adding
> devices through a variety of mechanisms including user-space through
> sysfs, device tree overlays and ACPI.
> 
> This small series decouples registration from the boardinfo and then
> adds a notifier to add the devices at runtime.  A future series will
> build on this to allow adding the I2C devices through ACPI.
> 
> [...]

Applied, thanks!

[1/2] i3c: remove i2c board info from i2c_dev_desc
      commit: 97a82882d8529c18ff15a0b5396d8c4bd2a36157
[2/2] i3c: support dynamically added i2c devices
      commit: cd5883f7e933764e2ddddd9cbb0f7ce18df127c4

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
