Return-Path: <SRS0=qFpp=CX=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A90DEC2BC11
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2020 07:02:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F4092217BA
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2020 07:02:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KmAdCnv4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F4092217BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z8WZshGld/48EvdK8tmb5ZPLlBq82Qj8Wo2y7vtz8s0=; b=KmAdCnv4nar3TBp7EZs05EzJh
	Ikh5d3aPEV3/xrt0ar/Vwer5Uxj/QPLRR9CdmXg0dK3nkfj8k424xiOa4nYGSj5eFNS5q780ZiIL9
	7hnaY9mjyz6mfReothZIe0dxnDnMv0Owt11IuELTgsFClyyjQLC990GaP5V0phMMsS7Jt+1b4oWWE
	YXoqpNVxN254F2Q3wZoP759v9IrQOZA2dnzMJuJYQiEnsHr9xjD7MamCmmN/CPbd42j4hi/aQUbO2
	4noRLeWqmG9QkB4opbT47jJTFqkTjdnER7qFWuU3NDJXluypwY/my70MyJQy6M380tU6psez2ZfG7
	u2JjbI+mQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHiVr-0007qJ-88
	for linux-i3c@archiver.kernel.org; Mon, 14 Sep 2020 07:02:55 +0000
Received: from mail-lf1-f67.google.com ([209.85.167.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kC7OC-0004v2-P8; Sat, 29 Aug 2020 20:23:54 +0000
Received: by mail-lf1-f67.google.com with SMTP id r69so509328lff.4;
 Sat, 29 Aug 2020 13:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0psqWY1UibiP9385DJlhe9bRQhCV2K+TluDGRru+tME=;
 b=QdWStf+hV0vOulKKl6hVxI/2kZ1aRwV0epLfK9uJNm6YADYMZnwJXxIWAccffTM+qY
 YTCq8MTn6h9WlQWBlgWhoOMC3KSQ6biOdDDkOrlqSk0IvXGZuUoilAZH0IyTm8e/yC15
 Q3xiSkmYaVJZh0GWQfxCch/wYDWqmZpQMTP4l5CjITBNjTPbzAEkG9Lup4gUnagi8cWW
 9Tm2/++OAALgiBi/D7D5mBHF481FhxPsefdnkBOD/sF0tLxFJLtneDJ0B4pS8ziY56Qh
 Q7ZPImWAqzUCYqHFcNPRyc/CHpR5G8ofHp1RdxlbP5NxH282BZyuT7OWo7XuKIlpNxc6
 bxIw==
X-Gm-Message-State: AOAM531BnDYS8bjqRAsxVTY8vZeHJK3dO9I2C3A10XHJSR5CJPsxVzzn
 riCFEralhaDTBdCxAvgJYFs=
X-Google-Smtp-Source: ABdhPJwM872sNAhubifrdDBbzbt/STgvyhSGC/r13IUxtKNA/1ZGN7aPD6YNtgUaT9MOwOnXH5y1Ww==
X-Received: by 2002:ac2:559a:: with SMTP id v26mr2171329lfg.174.1598732629569; 
 Sat, 29 Aug 2020 13:23:49 -0700 (PDT)
Received: from [192.168.1.8] ([213.87.147.111])
 by smtp.gmail.com with ESMTPSA id n26sm659380ljg.15.2020.08.29.13.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 13:23:48 -0700 (PDT)
To: Joe Perches <joe@perches.com>, LKML <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Kees Cook <keescook@chromium.org>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Julia Lawall <julia.lawall@inria.fr>, Alex Dewar <alex.dewar90@gmail.com>
References: <0f837bfb394ac632241eaac3e349b2ba806bce09.camel@perches.com>
From: Denis Efremov <efremov@linux.com>
Autocrypt: addr=efremov@linux.com; keydata=
 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
Subject: Re: sysfs output without newlines
Message-ID: <4cd6275c-6e95-3aeb-9924-141f62e00449@linux.com>
Date: Sat, 29 Aug 2020 23:23:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <0f837bfb394ac632241eaac3e349b2ba806bce09.camel@perches.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200829_162352_826651_A02FA462 
X-CRM114-Status: GOOD (  17.23  )
X-Mailman-Approved-At: Mon, 14 Sep 2020 03:02:53 -0400
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-usb@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>,
 linux-mmc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Kai_M=c3=a4kisara?= <Kai.Makisara@kolumbus.fi>,
 Pete Zaitcev <zaitcev@redhat.com>, linux-i3c@lists.infradead.org,
 Maxim Levitsky <maximlevitsky@gmail.com>, linux-scsi@vger.kernel.org,
 Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, York Sun <york.sun@nxp.com>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>,
 platform-driver-x86@vger.kernel.org, Robert Richter <rric@kernel.org>,
 Alex Dubov <oakad@yahoo.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Darren Hart <dvhart@infradead.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tomas Winkler <tomas.winkler@intel.com>, Kalle Valo <kvalo@codeaurora.org>,
 linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Boris Brezillon <bbrezillon@kernel.org>, netdev@vger.kernel.org,
 Oliver Neukum <oneukum@suse.com>, Douglas Miller <dougmill@linux.ibm.com>,
 linux-spi@vger.kernel.org, James Morse <james.morse@arm.com>,
 "David S. Miller" <davem@davemloft.net>, Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi,

On 8/29/20 9:23 PM, Joe Perches wrote:
> While doing an investigation for a possible treewide conversion of
> sysfs output using sprintf/snprintf/scnprintf, I discovered
> several instances of sysfs output without terminating newlines.
> 
> It seems likely all of these should have newline terminations
> or have the \n\r termination changed to a single newline.

I think that it could break badly written scripts in rare cases.

> 
> Anyone have any objection to patches adding newlines to these
> in their original forms using sprintf/snprintf/scnprintf?

I'm not sure about existing cases, but I think it's a good
checkpatch.pl warning for new patches. It should be 
possible to check sysfs_emit() calls.

Thanks,
Denis

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
