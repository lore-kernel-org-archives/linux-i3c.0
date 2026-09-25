Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621D3C98321
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Sep 2026 10:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fma3me7nmh8fY2O+zdwaLk5NjUZR5YbB01N07SAlcrw=; b=UEtaiT8iwzBzEq
	nx1Ot1fTHnLe58iUUUqROJZu5cZTgzzrLY4GdJ5VugOdAkaTzpCpaynKoC70VnuvGOSs6SLBUzFqK
	rgMvCzWYgnfti9H9x5t/oTcCqeSD03R4Fwj9+Ts2MekmJRz+YshGq+fnJEQo96aYaCpHCPZWGPGDK
	QXtf/CV9FYHeDZO1CIk7UdjEGyTNJy7wYZLGs7RyQepiaDjWsqEeavi3QdoQgiJpF6f4cKP9RKg2L
	jxxODWO0vIyU8ry/0qLxCx4hHOevHj6f9ib0gF75fyAfojinCGnXZjKdkaeYNmPqY+ilcYkLujT2+
	XpeXAWXmCahTy96PBD4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA3cm-0000000D9B5-0Czt;
	Fri, 25 Sep 2026 10:57:52 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA3ch-0000000D9AA-2bHv
	for linux-i3c@lists.infradead.org;
	Fri, 25 Sep 2026 10:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=anZU
	1KfXBrg0LBONVfZO0pF5ldmszDBWgaPcW+jObfg=; b=VzyewI3yGO86fam5WTld
	zvvz7ZZwnlYyWWaEVbLJY0SXay3FtSQG0IXNkSishLxmBPdBnZxcjwmIqHxGA3H5
	qpXD/AqBCejFa2WMaKB6chS5k2bGIAAADbdKXrQdFp3IRQnghM5qlxb43sHfU767
	QywHCw+cmThFPTcAWqyoxlAZO0Pj4VXCxJdo8hTan5crYNkNweu3zE9oIgbWC+TA
	kb6FO//YmBehA2iNiswLAWa/OKB+R5gfXrR8frTNOhqbBUy8iDTgxWTDqKOY+bpH
	E2XpS10vdMoyhpOO6GdfJOA4MYh0YowWFxMt+/NaN8CPPVv0DCLzgkE8N02/I6FM
	gw==
Received: (qmail 1529304 invoked from network); 25 Sep 2026 12:57:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2026 12:57:42 +0200
X-UD-Smtp-Session: l3s3148p1@r6HilUxcJoIujnvn
Date: Fri, 25 Sep 2026 12:57:42 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sam Agazaryan <samagazaryan@google.com>, linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <arZTphXbVF5wagy2@shikoro>
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <arY6DfVf_9tZ_TCu@black.igk.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <arY6DfVf_9tZ_TCu@black.igk.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_035748_568729_412515CA 
X-CRM114-Status: UNSURE (   9.17  )
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

Hi Andy,

> And you need to gather the opinion of Wolfram as well.

Dunno if I can help here. When it comes to driver development, a dev
interface is surely useful but can stay in some debug corner. However,
cover letter says:

>> Userspace access to I3C targets is needed for devices that do not have a
>> kernel driver bound to them, such as targets in ROM/bootloader recovery
>> mode (e.g., OCP Secure Firmware Recovery v1.1 and Caliptra Silicon Root of
>> Trust recovery flows), as well as hardware bring-up and diagnostics.

I don't know anything about these recovery mechanisms and their needs. I
might have time to look into I3C things after all the conferences in
Prague, but no promises...

Happy hacking,

   Wolfram


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
