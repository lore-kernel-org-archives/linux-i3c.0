Return-Path: <SRS0=EbLq=4F=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C06C34022
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Feb 2020 16:45:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC5AF22525
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Feb 2020 16:45:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PLmQ9IQ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC5AF22525
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGpv+x/ctpKUOTret9v9U5N7FZ83JsM0ugRVLbHYrKg=; b=PLmQ9IQ/9taW+0
	QGP81NhLwdTttN3AdPygoGcPB2vudUiUpuLS68YVU+5XU9QNLL/6y2CNXZWdQhK4SSzCkJmV2rqTV
	qY0HHzk8zDgAvxuBB7WKdzUdX2+k2P6Ja8tq29dR0swLXw+hQzfmFF2OvD+n5eUVQ+Qe11GK6eUxl
	fKmYDn/yZV+zBaPM3z5Jl7AlLrEe/nSXu4xPOc7ctQV8STi2P8IKC0E+p1Os9FFpbR3WQEQ4ZGlK1
	lg59eakWndzmxXTXFjsPIf1HnjCQT6sjL4SY8HuPatM4pbg6Uvxx/LaW0oji+hiH22DAdDTRp5K3R
	To3e4JQNB3Vt+qqMgc5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3jWi-0005Fg-8v; Mon, 17 Feb 2020 16:45:44 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3hzI-0002X3-BY
 for linux-i3c@lists.infradead.org; Mon, 17 Feb 2020 15:07:09 +0000
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MoNy4-1jnk7E1SHo-00oqhD for <linux-i3c@lists.infradead.org>; Mon, 17 Feb
 2020 16:07:04 +0100
Received: by mail-qk1-f173.google.com with SMTP id h4so16494990qkm.0
 for <linux-i3c@lists.infradead.org>; Mon, 17 Feb 2020 07:07:03 -0800 (PST)
X-Gm-Message-State: APjAAAVIKfaq+5Y+X4Mq2P2lA3AK5vfUzSoyLy/sC/eHcNrH25MTW4uL
 9eOrE0xhY5Q9rJA2H8eEZ9oomL2GENkQMPD6/8c=
X-Google-Smtp-Source: APXvYqz9OqBtba+abUUUMNKz6i3LC/Dw5ZdyGM5IHyBgCPdVBvXaDD8QWPzvQe5BJJJR3ttaBrcK7BJIlG+yyD9Ni5o=
X-Received: by 2002:a05:620a:909:: with SMTP id
 v9mr14320839qkv.138.1581952022158; 
 Mon, 17 Feb 2020 07:07:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580299067.git.vitor.soares@synopsys.com>
 <20200217155141.08e87b3f@collabora.com>
In-Reply-To: <20200217155141.08e87b3f@collabora.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 17 Feb 2020 16:06:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0jAbevb6mjy7Q=C-TFGn7uHRvshHNEO8XrDPRvRoAiTA@mail.gmail.com>
Message-ID: <CAK8P3a0jAbevb6mjy7Q=C-TFGn7uHRvshHNEO8XrDPRvRoAiTA@mail.gmail.com>
Subject: Re: [RFC v2 0/4] Introduce i3c device userspace interface
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Provags-ID: V03:K1:m9o/B/UAs8fheEl691eQDAco8P/HDt73b77iguM66yN/tbQwaMC
 Yufgjs9Do7MFe7Yl5/UMaDJ+O+iy+3LOhXcPo4BzC0230Q6LOVwy/IegR9HLGQfeJRHy0AL
 qXrkR1E90iK9OkLgVvsbVliCtDxkri8/r5OauXomZi4UhwZKGJfws9XvjvzbRYSBVqVUDoY
 RtsebhF+1RR0WBTU8XygA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iA8uR/A3M1o=:+Fukz03Lxssb6TajBEvz3d
 v12JoQVjjs6+GkRwJ0T2uSdy+3Qur/yeIQiD3pLhQnZomv8v5B+HLdjG7kjJXj5nKxyVnKI1G
 fHV2r43Md+1Xt9fLGQDl160VmDk+3bKuuVh84dFmU3t620RJGGXwvT7Nx9He3Cu6UP54QCGKO
 5zD+pqxjo/pf0Hl6vDeqRnxweSW8HyF/RpR6X3O05WiXSyX9hzYI0OTP8Vf9kk/nN8c/e0Hsg
 17bpSTGEiZvqqMI7CJVrlNty/k+eDvKLNG8qCKiqq2115ydZcn0Sz01fd86iYAvcnrDR/0vuG
 XB1uEUvf4jFCWMV5vumxj2DVsoBi094eT6s6MTaoDaSbgFfNMNOSz/S5fDrrPfU66s2qFM81+
 1harTnoh6WSfdRZGADWQGKA/mlbWQ4TxYphk49ARpgG3VZXIGARhF11ee/PqMGiPMyamInVKV
 4iS44PbnRlNj3jX5J1YuLC/3oQfMF4Cem3IgoHX7w7ZGI/hlX3hiOtcmLTk9nBJAyONFAqt0Z
 lFECLQpx7040xjdyYRSfm3muzSUqxptTERzlKA9EeEcGdsQYLV427orWj4BWV0BIU4VVp9jDy
 GjKvtgxiUY/k1bVbQnX+yTlYZh1SzhxZalvDigRS0LM1jvMk6BQNuYjU19kdIpYGhl6epc+n2
 DkFBba8qT+Qq5C0qiw1eYdgazQZvmM5sjTBI9xTwoeCGTlfPa6l0LxaMNfSHAAiK1ZBAfbfI7
 ZAqtvgtMl721nFOSGjNjQ/MiUm/dr6abaDQilVGPwyrnk0if7oUKtn5/eD2l79mwkS0mDqIof
 pYmXdvFHcw5nMukxgawUSgYkUyIbzET2Pr6dFBaHzR1BwOArfA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_070708_695035_C6039496 
X-CRM114-Status: GOOD (  18.00  )
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:45:42 -0800
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Wolfram Sang <wsa@the-dreams.de>, gregkh <gregkh@linuxfoundation.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vitor Soares <Vitor.Soares@synopsys.com>, Mark Brown <broonie@kernel.org>,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, Feb 17, 2020 at 3:51 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
> Sorry for taking so long to reply, and thanks for working on that topic.
>
> On Wed, 29 Jan 2020 13:17:31 +0100
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
>
> > For today there is no way to use i3c devices from user space and
> > the introduction of such API will help developers during the i3c device
> > or i3c host controllers development.
> >
> > The i3cdev module is highly based on i2c-dev and yet I tried to address
> > the concerns raised in [1].
> >
> > NOTES:
> > - The i3cdev dynamically request an unused major number.
> >
> > - The i3c devices are dynamically exposed/removed from dev/ folder based
> >   on if they have a device driver bound to it.
>
> May I ask why you need to automatically bind devices to the i3cdev
> driver when they don't have a driver matching the device id
> loaded/compiled-in? If we get the i3c subsystem to generate proper
> uevents we should be able to load the i3cdev module and bind the device
> to this driver using a udev rule.

I think that would require manual configuration to ensure that the correct
set of devices get bound to either the userspace driver or an in-kernel
driver. The method from the current patch series is more complicated,
but it means that any device can be accessed by the user space driver
as long as it's not already owned by a kernel driver.

     Arnd

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
