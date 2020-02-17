Return-Path: <SRS0=EbLq=4F=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4014C34030
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Feb 2020 16:45:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8564B215A4
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Feb 2020 16:45:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ITq1Mt8G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8564B215A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3adfS+P9BzHmR1Vgh03zPLafKfCSV1iNVq7STm8ZN4=; b=ITq1Mt8GxdLnqb
	UGTe3mFJ4zVP1L9bpqX6zEnlvzJcdk7vySwdRaz6nqiHJCRBd/A5TMf+3tolSgJGx7mg3+jilnk99
	89Q1X5Kf/aeRvF+JRC+qU7FxbGQABVevPFLOjOrVuE3qvZxPyt80nqS8cGN/9eExbOo/MGEwRwS5g
	gcCK5Tqf34ZMLxITIRYJp1N55zK3/N69FiffXZE/f1D1xAz7yyT2cy375R/9GHdQPTWcI5IprQkCG
	Wxxf6nOsJEgxZlwadm/yy4KBR5CXiwJQ22ZMSOj+uHLbkInoZNTjvqeEbPQkwKtEWd5r8F30baCFk
	+jQLKfw9xgW9nE9WsWQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3jWk-0005Hi-4M; Mon, 17 Feb 2020 16:45:46 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3jIv-0008MT-SO
 for linux-i3c@lists.infradead.org; Mon, 17 Feb 2020 16:31:31 +0000
Received: from mail-qt1-f182.google.com ([209.85.160.182]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N63NQ-1jWCLl2o5A-016Nde for <linux-i3c@lists.infradead.org>; Mon, 17 Feb
 2020 17:31:25 +0100
Received: by mail-qt1-f182.google.com with SMTP id l16so7772284qtq.1
 for <linux-i3c@lists.infradead.org>; Mon, 17 Feb 2020 08:31:25 -0800 (PST)
X-Gm-Message-State: APjAAAWYqR48m3rwi5BxtSIPHi1qqA69h3YfQu0MQpKvdef9rtU0S5g9
 lS5KXG8RNGeyzAvCDaGPLKzU5lTQ1gZbenptaNo=
X-Google-Smtp-Source: APXvYqyGebgskD9DJnggAXDAzLcpUd37EudJOxUPk6hTCsINePQmNXOJ6CgjR7jrFr4TGbNM4fkWp15166EEI9MfXls=
X-Received: by 2002:ac8:1977:: with SMTP id g52mr13579716qtk.18.1581957084396; 
 Mon, 17 Feb 2020 08:31:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580299067.git.vitor.soares@synopsys.com>
 <20200217155141.08e87b3f@collabora.com>
 <CAK8P3a0jAbevb6mjy7Q=C-TFGn7uHRvshHNEO8XrDPRvRoAiTA@mail.gmail.com>
 <20200217163622.6c78fa3f@collabora.com>
 <CH2PR12MB42166ED8E84503B53340F80DAE160@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20200217172309.26697082@collabora.com>
In-Reply-To: <20200217172309.26697082@collabora.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 17 Feb 2020 17:31:08 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2O23=Jjmj0xTQC7pePnwHBrcJ1YeRAKp-1hVf1GNmA5w@mail.gmail.com>
Message-ID: <CAK8P3a2O23=Jjmj0xTQC7pePnwHBrcJ1YeRAKp-1hVf1GNmA5w@mail.gmail.com>
Subject: Re: [RFC v2 0/4] Introduce i3c device userspace interface
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Provags-ID: V03:K1:QaCMl/JcPQFsytY5Oa3h9qn8sKZIRtFZaYXNaPuxzLjYLexb2RU
 f/+ZPepSs92y5MQQ8Vghg0XVsRtiG+01kZxN8AggTfwuODHGV2LB+NcK7iy7HKKsbY3K2ga
 zlH6A3Dadg05AOT5ThM9+MFxiQDYEa+YILAyWjf5VTSWKT5vKZ1sDHPO5pPMgIHJ5z7N1NH
 NNV5CVPYuEMhAoCTbWTKQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AFxy7oh/DRY=:YPAxMxMstYdItFr8ntDvMV
 mE0pWkaw3JfYvfu+xSVC3E1w/eziefBPPhnCaVlxnv/yVbDda+KNgOO2PleeFPc/ZnZoFv8DJ
 e6WjxKbX46FeafPjYlMeu4C1gVsIRygIsvY+QGn+132v9F9F0ZvvMmC1vIODpxQeR6GWUtBxc
 MHQ3zmrYzgqWbcJIhJizxpWrbYK+r+mSYQll2jjYR+/DrDxpQ8cPnW3wqemK3X/l/Hiti//vL
 7bguSaWHSkLfXnWsKIzrvh6qKCwXxEiuK+f1N26C0uzkKR+f7oyvwID8iv0pFoikTLdjVUina
 p2w8YAz0YKxj6+MdTX4HmBgoL6zH5PjrduWnJVUEl6TfGbvsLmDlywSetR36wfzjrkOduQ/Xx
 Q6aL7c+QLuR612ksmZ9umNnhfMAuMQSPYW1rtcJNmQ0zODmY/rmteZmArjWulV2kUwmJlKAvt
 3OZBBYAxXzPZGS1ArsEfOfkEWvAiWownmqnh2ZkViPglpM64N3xxWv+qlFM+b4X7UK/XqZ1Ge
 KFjUYCzTcY9CIIn+DT/UKp9ejNeTAxPA0ht2iLlmr8vvLnNMlJfx3H6iBms78DGZGTpcpk8F9
 s2tiJcGoONKiOah9dD/HSEayBTXrjxV3nYYb3JSl0ViRDnQ2kD94+Mc/zn/3e/a3I5x7mPckC
 2sn2OKeDr2JaOngr/NfC0TIs/ddycbHfK4DbOewMhBQD+tr16HEYCJ+xMLsGcAuJwYnyTToB1
 +7jx6TgOPy7nfAJiyg9K0OwlOY6vmGGridm5MRwESB/TYP+IXrelDc902W/WsN8/yF08tniRX
 0u/rx/8sKxpVhDGMOdEYT6RSgzepzak2WK47mSEU18ybOxwq4E=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_083130_218822_FCBA06A4 
X-CRM114-Status: GOOD (  17.02  )
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
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, Feb 17, 2020 at 5:23 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
> On Mon, 17 Feb 2020 15:55:08 +0000 Vitor Soares <Vitor.Soares@synopsys.com> wrote:
>
> Okay, I have clearly not read the code carefully enough. I thought you
> were declaring a new i3c_device_driver and were manually binding all
> orphan devices to this driver. Looks like the solution is more subtle
> than that, and i3cdevs are actually subdevices that are automatically
> created/removed when the I3C device is unbound/bound. That means the
> 'on-demand driver loading' logic is not impacted by this new layer. I'm
> still not convinced this is needed (I expect i3cdev to be used mostly
> for experiment, and in that case, having a udev rule, or manually
> binding the device to the i3cdev driver shouldn't be a problem).

I'm fairly sure it's not needed, other approaches could be used to
provide user space access, but it's not clear if any other way is
better either. It also took me a while to figure out what is going on
when I read the code.

One thought that I had was that this could be better integrated into
the core, with user space being there implicitly through sysfs rather
than a /dev file.

> I'm also not sure what happens if the device is still used when
> i3cdev_detach() is called, can transfers still be done after the device
> is attached to its in-kernel driver?

I think this is still an open issue that I also pointed out. The driver
binding/unbinding and user space access definitely needs to
be properly serialized, whichever method is used to implement the
user access.

       Arnd

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
