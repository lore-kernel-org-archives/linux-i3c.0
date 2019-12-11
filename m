Return-Path: <SRS0=zIxT=2G=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B30C2D0BF
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Dec 2019 18:36:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0A76207FF
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Dec 2019 18:36:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VQCtQZj5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0A76207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoHZ7L6a3j4krovm1ncvqZitL1Cq+qnxMJe/efI+2Fk=; b=VQCtQZj5KkevM5
	4Su80eqVYpm+BrGtwQffq55Q7BuQxQ70WOvC2ZuKLvgDeQZFs3yv39M50j1aErzvvUsEygUEJpEhi
	nuED44XgavKVZiOaumSB8AIwraysdIH8hZAjd4yLxQBTMaDluDYpE6VBg9bMvKwgi1/w813hBusCK
	F/NxAmhww7PuuZb1i8TRMgRc0Mg0QU0prynom/G/X7ZbuNzYOOdzGh6cUIRrO4TRXUFEbgZvD0hvO
	l+mc4BZDSuHsnESkqH5eAEUAGL8CjL3Go0RCAcMOXrxAPMAcqkSQK02h9XpAGV4IMcstpaZgtfUXf
	yPiz7VlBbCZxge+OcGcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igvE1-0004gz-1C; Mon, 16 Dec 2019 18:36:09 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1if3zo-0000LN-0T
 for linux-i3c@lists.infradead.org; Wed, 11 Dec 2019 15:33:49 +0000
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MBBCI-1ia8aW3s5u-00Cf96 for <linux-i3c@lists.infradead.org>; Wed, 11 Dec
 2019 16:33:43 +0100
Received: by mail-qk1-f173.google.com with SMTP id c16so11560038qko.6
 for <linux-i3c@lists.infradead.org>; Wed, 11 Dec 2019 07:33:41 -0800 (PST)
X-Gm-Message-State: APjAAAVJ2CGqqtCW3xzOuVoR1/A6IFRrclPLdm+VTP6ehvBhx2c/LHDQ
 tWL81MDJ17A/1l2frOKkQyK9ChAWkBpGATPBlCA=
X-Google-Smtp-Source: APXvYqxmeB8TjlMCMi/FqHf6Gou8DAqv4Puz6Gm0jsLC3WBKTCxWNeE/74JK2vXpaV3DnctI1gXS0DxSAbNlFi1R7Zc=
X-Received: by 2002:a37:4e4e:: with SMTP id c75mr3368164qkb.3.1576078420833;
 Wed, 11 Dec 2019 07:33:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575977795.git.vitor.soares@synopsys.com>
 <f9f20eaf900ed5629dd3d824bc1e90c7e6b4a371.1575977795.git.vitor.soares@synopsys.com>
 <CAK8P3a1cwoTbT3zsa-tfApwewDT1-ksHZs6_vkBYpKbgptsfjw@mail.gmail.com>
 <CH2PR12MB4216E04995E421F04B7662DEAE5B0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <CAK8P3a00wfUbGU1a9nS1dtDsUo1GR1V1WqRwa+DmUKVStvicTw@mail.gmail.com>
 <CH2PR12MB4216CE03448AF3B39C23D3BCAE5A0@CH2PR12MB4216.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB4216CE03448AF3B39C23D3BCAE5A0@CH2PR12MB4216.namprd12.prod.outlook.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 11 Dec 2019 16:33:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2vRG9uiY6jCRip98DHVP5-FeWk_sToGrPSA_WcY0agcA@mail.gmail.com>
Message-ID: <CAK8P3a2vRG9uiY6jCRip98DHVP5-FeWk_sToGrPSA_WcY0agcA@mail.gmail.com>
Subject: Re: [RFC 5/5] i3c: add i3cdev module to expose i3c dev in /dev
To: Vitor Soares <Vitor.Soares@synopsys.com>
X-Provags-ID: V03:K1:7GMeD5g0Z3pzpftiiTpKUkb/WELjDg63kZFEQQUkAIU55UFM/v9
 6TQX3aJ2cvpXXmbP8tJ3B8ylJODL4wtHLS3o+FO9tU8Oc3H6NDa+OMFwaXma/1Il1wn4z7c
 oewd4xrskf1zefPa4zLpJzEb4SvX9g8cA6GNtJhOn4cxJzpK4vih4CeMiU2itrr3XusiO0g
 hBrJ2LGqR4CmAqe3T8U3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t2v1k5pb+pY=:N/CsNeiMi8bIHloCbr+z51
 FZDFN0zNoFLeDx9zSBlyrNLXsZZrq135MKJOZjGzTwevfpBnTnxyt/+FZYLPuZDjUihkihnQw
 ILAIYQws8NEtkpGaMeyzg2ILrurDjbrYFMCEVL8QXLQB/COJqbI21zDeHFaaEw0NUd7Sydmrp
 g5R1JJOWODZY3rtD88qtylztbKqQI6aKsPAbWEOwSxhZYxueLGHZsodBYL7RKh2pkxPLcn3+g
 XhcaR71FCNGnLz1cM0ZrCDEYrOpUSgJwkxLEnlL9zT9hmUYoBjOD3rvuYc8Xp2/xc3Lyeu/EW
 SvBWkNx5q4OsWwWjD1iZdGGvkhVS3yKhLbOpcE7IxN4LcbDTHOr+TJZz8PtGs9Qqlz2d0wQ0S
 6UPZX5xFXTCd8BR7hfDOKIzhu4d4Vic3ffpUnjpCt7K18a5vLy0QjxeKbpocZyGZeTI97v4cU
 NJU4i6j1OVGL2KuMdWXK3Y0aw9nUMk8xU/KG5HYt6ddNmS1ocKKSxmUyTi5x0+ihl/pyYRYSi
 /C+9Cprvdwavj92G/r21iLZDLoM9GPGbuRhejONb/LgD5k+YsDWdOrFj/JeMtmNGyX2Ey9/jF
 sLXAK80lIFp0MPNk+fbEZ6Y4G9t1I4Grh3QR4y9EXKPRzFxFspCESTrDdDdm+2lx6GzYPzIj8
 96KPcVRYSYPyAmeg9vJPe58VHUuXr7b7/wQGcS7idG82TsxxetkxouTmvcLfi/Po5zrv+xZdR
 XtZyMBrmdoVerb/rwru1NMZefGUxKO3mVikbO2HxapNgxQtXxDs6BJc/1po+fpy3pzzgrsRdy
 /C1Kdq7t0TU8wtdDu0UY9+wZ0UUhPV5e68kvQXCanhAYjhnhNcV7Rbq6tRYnbdtM4fVlZ6hKS
 Ah0U3rCoc2hlfn+BNX+w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_073348_342339_B055A9E5 
X-CRM114-Status: GOOD (  15.16  )
X-Mailman-Approved-At: Mon, 16 Dec 2019 10:36:07 -0800
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
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, Wolfram Sang <wsa@the-dreams.de>,
 gregkh <gregkh@linuxfoundation.org>, Boris Brezillon <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, Dec 11, 2019 at 4:07 PM Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> Date: Tue, Dec 10, 2019 at 19:37:14
> > On Tue, Dec 10, 2019 at 8:15 PM Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > > Date: Tue, Dec 10, 2019 at 17:51:14
> > > > On Tue, Dec 10, 2019 at 4:37 PM Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > As your interface is basically just read/write based, I wonder
> > if there is a way to completely avoid the ioctl and instead
> > use io_submit() as the primary interface.
>
> I confess that I wasn't familiar with io_submit() until now and went
> straightway for the ioctl() approach.
> So far, my understanding is that io_submit() will call .write or .read of
> i3cdev module depending on the iocb command. if so, we won't be able to
> do a repeated start between a multiple iocb in the same list, right?

I'm not sure what you mean with "repeated start", but it's definitely
possible that io_submit() is not a useful interface for i3c. The main
advantage would be that it avoids creating a complex ioctl command.

> Apart from this private read/write need, another requirement that leads
> me to use the ioctl() was:
> - When we support HDR command in i3c subsystem we can expand the ioctl()
> command to support it.
> - For now, device API doesn't expose CCC commands but some of them are
> used for a private contract between master and device and we likely need
> that support in the future as well.

I think you could still have both the io_submit() interface for basic I/O
(if you can get it to do what you want), plus an ioctl interface for more
complex interactions.

     Arnd

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
