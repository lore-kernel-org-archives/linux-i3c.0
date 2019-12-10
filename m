Return-Path: <SRS0=zIxT=2G=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1256AC3F68F
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Dec 2019 18:36:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB20B22464
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Dec 2019 18:36:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uo4m9jRV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB20B22464
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mS7sZmkmqrPZ2XHPH4iZLVJavRBrh9xOYJZ464/z5Ss=; b=Uo4m9jRVAX9At5
	5YsYf1E2+q1z7lq0cQhsd0UffBwBk502fpAtNSBnOLCxTPLBQhseAf0DQ63rEjR9SjC7Lf/s1aTct
	Ge3SHX8jAkupPvdjnCxA0gm50tJYwl0NyAQ7frz9sO9rL8oIb8W51P4oWtCdSWb7hydwUMN3C/KVZ
	fRnWQJtNaiyyO+pWY7sBOGGQPMGY1hG6qkuAWmewYQqWpI3mU91hIVhKVEaeJa1Z+uLue2Xkh98xx
	wiVAAh85BGle4aQUf/Da+LeJnphc6gaROHRuo0UAakN/dg34KF2L6oR7dtW13HbYhzzdrvUcDA/3i
	Dh+m6vmBnmNHJvfuok6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igvE0-0004gs-U1; Mon, 16 Dec 2019 18:36:08 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ielKC-0000Fo-3c
 for linux-i3c@lists.infradead.org; Tue, 10 Dec 2019 19:37:37 +0000
Received: from mail-qt1-f179.google.com ([209.85.160.179]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MxV8b-1hpfpl3jkP-00xw5x for <linux-i3c@lists.infradead.org>; Tue, 10 Dec
 2019 20:37:33 +0100
Received: by mail-qt1-f179.google.com with SMTP id w47so3905270qtk.4
 for <linux-i3c@lists.infradead.org>; Tue, 10 Dec 2019 11:37:32 -0800 (PST)
X-Gm-Message-State: APjAAAWBenenhqPrKDcZa6RvEzdrdcdZZmae4LHCjNRVQKCwMXVf8UY7
 +SU80ZXq6sNRfAS+CApWK4bA8DTcEV0AmcneFhY=
X-Google-Smtp-Source: APXvYqxu2OeX9OeaN2eHORjywFxaUKQM7SOvVqypu3yeViJF7xtud3Js32i7/ANuafpu2FsYOmXwowjE9fDD6LyQpj0=
X-Received: by 2002:ac8:3a27:: with SMTP id w36mr31050677qte.204.1576006651717; 
 Tue, 10 Dec 2019 11:37:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575977795.git.vitor.soares@synopsys.com>
 <f9f20eaf900ed5629dd3d824bc1e90c7e6b4a371.1575977795.git.vitor.soares@synopsys.com>
 <CAK8P3a1cwoTbT3zsa-tfApwewDT1-ksHZs6_vkBYpKbgptsfjw@mail.gmail.com>
 <CH2PR12MB4216E04995E421F04B7662DEAE5B0@CH2PR12MB4216.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB4216E04995E421F04B7662DEAE5B0@CH2PR12MB4216.namprd12.prod.outlook.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 10 Dec 2019 20:37:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a00wfUbGU1a9nS1dtDsUo1GR1V1WqRwa+DmUKVStvicTw@mail.gmail.com>
Message-ID: <CAK8P3a00wfUbGU1a9nS1dtDsUo1GR1V1WqRwa+DmUKVStvicTw@mail.gmail.com>
Subject: Re: [RFC 5/5] i3c: add i3cdev module to expose i3c dev in /dev
To: Vitor Soares <Vitor.Soares@synopsys.com>
X-Provags-ID: V03:K1:AKQMXIxQn0inUAkpYpkt936Co2gYdz0SWiXtneAOludL9DCQEBz
 km9d/5h2OVplRsDUySXG4XhKZNUlbGmoa9WQ0NIyNLKNVrEqUd491GTcfHCsW69Th51tXyu
 peWYGDuQBEmmJFHLnYjKf98xW8Y5BH1p8fUPsLc2eu0qnot5xd/94XZcEzpGrfCA/uxENPI
 sYkNlAqwX+3gCs2Ta76yQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hs01Cvf1GpQ=:2kLIxF0tpwKt7kD7lH+/RP
 eNsOEfLsIdxxMOaJ9MFZJaCjy5ltgOAV3fw+JI8PZHPUNeGJvDPmYwAH4MFX+sk8GXvO2rBI5
 5zXpDyWmWX0zpLhZ2fqx+bBszmu+NYb0RBtU54dAyLXh/c43rQbEGtNkCJTw4TGMdmbUpw34t
 skrxh5nqsewyLBu8XMtqJZcjx22m6mk7opTBjDveqv6hoTPW02CTfv9MGq9YxVlVlDtKqKazD
 md1KlTMhK64WwDD8J2MlVv1MEY2mfSHlKBePyo1596hWPJ04bNnBOqf4WJeTMj5nsPyUairiS
 y8+Ta7bK+q6aLaKyWlE721ckLB5hawfh2VAP9tFVYVJJl/SxNtngkZLxN/lBMpHSiQoaNPAto
 2+aaUOf21UNyJ2/foqfyQ4skeExHYLAvgc1qaHLzxx4VkxizDiW290si5nYFaiAHg1lEL3SAC
 s85ZwSmxs7zBk/RYhU0kj5obEmLcSfWdQ6Mfb5YFwMT4e1GVoOZQmlJOnQELozAACbFyvXAZG
 TGyM1Ja2yi4+Sf/4Vb68RIdSn/Ja5W7zWQAaLxPhrY3uQEjuii7xhtxv0Cbi/ouPg141j1BiA
 cuXZztuE9QyPtqf94iIDWu33rV1tg6z1hYXqD6am61j2UkevhdYjlFCCZdA5+2DpdVp2Vb0ZS
 wweT0pLcKrYOH/yjbbx8RWIkxmp6gogPR/DR0e+XtCigZiD3NZI5/gdto17gS6ro6NesskU5B
 q4IhcZo4pCW0tqbtN7IvM8ijMKcE5NNPVNTPN7gJ92JVl1abDWKwUwdtdNmicrzWSaUUTSKLy
 JGgxJMlPboNB6ZXyF37xbG8xRHiryvdjtLRLngsMUiJRxL/pxRNo3vQVp2m9PkZvKHy8AwRzH
 blFmF7xEv27OnqDNBsRQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_113736_437692_F1DD3C8C 
X-CRM114-Status: GOOD (  18.36  )
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

On Tue, Dec 10, 2019 at 8:15 PM Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> Date: Tue, Dec 10, 2019 at 17:51:14
>
> > On Tue, Dec 10, 2019 at 4:37 PM Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > >
> > > +/* IOCTL commands */
> > > +#define I3C_DEV_IOC_MAGIC      0x07
> > > +
> > > +struct i3c_ioc_priv_xfer {
> > > +       struct i3c_priv_xfer __user *xfers;     /* pointers to i3c_priv_xfer */
> > > +       __u32 nxfers;                           /* number of i3c_priv_xfer */
> > > +};
> > > +
> > > +#define I3C_IOC_PRIV_XFER      \
> > > +       _IOW(I3C_DEV_IOC_MAGIC, 30, struct i3c_ioc_priv_xfer)
> > > +
> > > +#define  I3C_IOC_PRIV_XFER_MAX_MSGS    42
> >
> > This is not a great data structure for UAPI, please see
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__git.kernel.org_pub_scm_linux_kernel_git_arnd_playground.git_tree_Documentation_core-2Dapi_ioctl.rst-3Fh-3Dcompat-2Dioctl-2Dendgame-26id-3D927324b7900ee9b877691a8b237e272fabb21bf5&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=qVuU64u9x77Y0Kd0PhDK_lpxFgg6PK9PateHwjb_DY0&m=5Q9WjK0o93NR7DQ9NM6So6mfdgpNnZnSaP8qMpgaC7E&s=LzzjrUQAG8fx5jkVyK73dBDrahNAvk09Cxxlx3KOiXI&e=
> >
> > for some background. I'm planning to submit that documentation for
> > mainline integration soon.
> >
> >      Arnd
>
> Thanks for sharing the document.
>
> My understanding is that I should use a data structure like the struct
> spi_ioc_transfer, with this I may also use the same ioctl command
> definition. Am I right?

Yes, that would be an example of a structure that follows the best
practices from my document. It is still rather complex, so if you
can make it any simpler, that would be ideal.

> In the documentation you also refer the compact_ioctl() and It is not
> clear to me if the compact_ioctl() is mandatory in this case. Should I
> implement it as well?

If the structure is defined like that, you just need to set
".compat_ioctl=compat_ptr_ioctl," in the file_operations structure
and it will work, but you cannot skip that step.

As your interface is basically just read/write based, I wonder
if there is a way to completely avoid the ioctl and instead
use io_submit() as the primary interface.

      Arnd

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
