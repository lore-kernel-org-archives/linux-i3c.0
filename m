Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046E5CA9ED0
	for <linux-i3c@archiver.kernel.org>; Mon, 12 Oct 2026 21:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V860mabaWGxJHDzWIBCBakjwAjARVUSSId2UQXNrCBM=; b=JrNy6VxGmY7ojX
	o3tFKK7UamaHCpEKpTBTymg3K7pB4XPIzjiHOD1mIOQqP9TcPbeay0DxE/mSK4xGPP/JysqS8olDB
	gAR6AohIqqtRL2OFoQFVqY9CKAGT4ZU/NSiuhQR5eG6/EGzehhusdWrGCZMFM6odwjvwmITTtRynq
	fBcSBHR0JjEnXiPEC0mUNUWEIcXKZTnpMs3YDUrs0fCix6SLZ7ikzZxHAiX+VWKPC/5tvDqHjmPjd
	wBzmsP9R5jsVyY8S6XnzwwnnJke80FaDAuE5tI3EoiYPBSGdMuh6QUSdoA2Psb9JqOcr0Ec0q41Mw
	0KOPVidm3kbVezAISy4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNu0-0000000Ba2K-1G61;
	Mon, 12 Oct 2026 21:49:52 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNtv-0000000Ba1S-2t4T
	for linux-i3c@lists.infradead.org;
	Mon, 12 Oct 2026 21:49:44 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-6768403e9bbso1815621d50.1
        for <linux-i3c@lists.infradead.org>; Mon, 12 Oct 2026 14:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791841780; cv=none;
        d=google.com; s=arc-20260327;
        b=D5PhlFh3+/9kj6kBHwYB5ORNV4XWQsHK6faovsVapvfynE46rG10I8/Ybk1+S4yY9a
         DcL6ieXw5Nalx/uM3aP7kkhKLcEZqjEQ0W50XZFvYZjwapgyArH0WignOhy+Swdq2Gat
         ZS7zCrakGNEYwsm3wH8dmWtMEzb2kthVyZkRbQiNXo3l7bpY0cFuu+uF0w4v0/RaflFQ
         i/SpuPDSaWfswTZIVTA4MEhyES10FmKCoR2s7tJL/ydbL7/nf8Hs7GD1bNC8wpqaYb2D
         O/LaBuc0xlCnKO/8DeheqIXQ+11Lxgv9KOnzwRAFa1clymp7f0Qc9BKT8WE9BVH2UhVA
         9mJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F7Bf62sHsaul0v1F9+XvEQQt1rpIakpJfffk6zIiLPY=;
        fh=2u2ZyLAVqvCQQP22EfR/Q+K3eLD//GjLXRL8FM6ohQ0=;
        b=g/DyShb5a957lyH3HxpBVsjoBoKPHQk9gkp5Sqv8rf+UHNdS1da5DqxLXTPMUIqhPo
         U+GXM6vK3ozTMQSRgECiBo6N9082rG+Exnw1D9ceh7ZbXrbVryABduNoyRC4Fn+0x6Ey
         qxNFbHd4aAH1e/tejXgf9wC8I9pIqLv7DCnzyn3VQ/KX0SPPTTHhTmH0HGWH4c+u9VeZ
         sd/N0Ry+qB2/P1VWM/taDmHpPxXSOKhRagUsutE784CldmPR9QPnXiw9StI8bfms3sLH
         jYVxSRAVqZUgXmh60JZFNufX7vsMeCZO323uKklGPnwFbmfPBlKNN1wrVpguav3NzBv3
         xZOg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791841780; x=1792446580; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7Bf62sHsaul0v1F9+XvEQQt1rpIakpJfffk6zIiLPY=;
        b=O8IOzVm/HSPrpWEIzXHLWwnXxZya9wQ9p321D6ZXT+9dOHiIh4jqD3tiZt/gq5U6xP
         kQXSgm2HxjbG1AwlMh594ol0vI+GlHQ7f8TZYP8S/lsvRdpReifMSLYAr6G/CbSY1HBr
         tH7ZfpBn1fdZpVOeVPAy2qwKHUg/9BXbPigMFTMakX1wcsDING/jdHK4S0QhE2N7BVY+
         lvYhexiTcKNXcoc3yq5TdJInO1j0fvDTWJP4S3qO3irTmJOwlogI36JYW8Shfgg4eKb8
         aF7yHML9XVJRO580RteX7HhNrH04I6GQrh16vOEk2tDfzI4quADW9H4395r5asJZQRd9
         92Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841780; x=1792446580;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F7Bf62sHsaul0v1F9+XvEQQt1rpIakpJfffk6zIiLPY=;
        b=HgqtudKS4ounMng2vOvQrdv2kEFMOxg2bZMEG7Em8HYeZA8CLdo2emebB/WI3dwxR/
         GDEbcQ0dwHzaKn1F0Xrgk/00nnrU1lWU+iggchH53s740DJPq5cfdlWHs4sUORmFI9L7
         XzCQtzXBwA2YCfPIhu0dtNNqiw4UVENwdCqvLLKqz/UbPISIxEGs6kTB5uQ2hzTFIhlP
         nvUSGor2jPkNSOi+6Q5XOqJuv/3AD/5FmsdDaYNxErjLtF44ICRcfJeVO41iKQbJ7XlO
         NrpFuOEOOKgszKcL6s/iU94GNjCrlSAUqiTWUpby2CfiZ5GTa44+x/DWfTGTsmYkVJUM
         yyCg==
X-Forwarded-Encrypted: i=1; AKwUvBwtiAZVl1C4tLvqs7ghmJm+d/6w2V7d3n3RzD81xjXd341L0Fdxye0p75eog2wM2Eh7fqnP9/2pe/g=@lists.infradead.org
X-Gm-Message-State: AFq9FYLa6yP0SEYpcUAcrYJ3sxuWiMas8lhHR9SjV5cOfdrPmWaZukv/
	5+GYyuzRphlQzkm2iqZTUJGenNvz3RPTJgTvpR4Ks3aICq/tpE6OhadSKu2JLlSgzffqkSuYYlp
	trtaT9GEbvQtWAegO4gMEZOFX9Ba4JSVq2BDp1rqdmdLaCZzVABMpZd/FTxg=
X-Gm-Gg: AYBFou3NkbdrWzyx7Fu9SOJf6D/rBtqbUZiJe6NDvF+7zZOoWRn/qNlRqfTS+Pk5jx6
	oym5FF7fGrCvecMImbUpAKgSlus9dDVSOidbx0g1N302RqfzhiisWgFqzk4ytIRQ10jrIal0rBe
	AkN+uFCAEDDs5uLdDkidQ2xxtNPuRU8Emco+MEG7mLQXkAKEXBTM8bx/hN1Fxo4vrRGCv3ppbzL
	GobuQl8RJLCwYyipUQOIHl8Bd9Lsc78JWyISjIyqlINdrzM6yilofrHMGpdaSGcaV7tq0lKj+o/
	MDo/vhdvJzG7kUePiVX60lWXJ8fhnRkZepC+Y6M3rPDlzCmIP5Z+xWJxD0uaLRakxdDselHsG+Y
	UPdb+Jb7crw==
X-Received: by 2002:a05:690e:4186:b0:679:2a5f:52e0 with SMTP id
 956f58d0204a3-67936ad3896mr3031391d50.94.1791841779960; Mon, 12 Oct 2026
 14:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <20260921230603.2518652-4-samagazaryan@google.com> <araSUuwTSx0aIuDp@lizhi-Precision-Tower-5810>
 <22623823-a2c7-4627-b123-12d1baed0e93@intel.com>
In-Reply-To: <22623823-a2c7-4627-b123-12d1baed0e93@intel.com>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Mon, 12 Oct 2026 14:49:29 -0700
X-Gm-Features: AclHuK-u983zXDJaYfr4f2s0wFVToPP9tOVKNN3Vc-Sa_lJ8nkqL5rmnPK1aDb4
Message-ID: <CAHreonGHGeg-SqA-OwyLKUy_Do-x16H4_ce6J8ndYkuyE2Dotw@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] i3c: use actual_len for read transfers
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, 
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>, Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_144943_741661_BB1BFCD1 
X-CRM114-Status: UNSURE (   9.29  )
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

> Also i3c_dev_do_xfers_locked() should probably clamp actual_len to len.

Done - fixed the missing rx_bytes line and clamped
actual_len to len in i3c_dev_do_xfers_locked() in v6.

>> There are not dependence, suppose mctp-i3c.c change go through other tree
>> It'd better use sperate patch to fix it.
>>
>> Need fix tag.
>
> Isn't mctp-i3c.c dependent on the len -> actual_len change in
> any of the master drivers?

Yeah that was my reasoning for adding it here since we're converting
all drivers to stop overwriting xfer.len.

Also, will add a Fixes tag for v6.

Thanks,
Sam

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
