Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53942CDB466
	for <linux-i3c@archiver.kernel.org>; Mon, 22 Jun 2026 02:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/VfOzRQjuTnIPJ/m2ZI2CWCKnUkoxnTd7AB85N4i8U=; b=2fVuBoo+LBfADJ
	wESXkfay2tJe9axd8IEP1hbHgyk5W6Wo4vK5YfGEBzjEUB5jYKsOZQ6IKMMAdPQT0/BOvVN2y2Ryy
	qIoklGYZ+eqyCFY/74PG2+XYdt3rQZwPxtUbIJpJx/W7ePgoe/BvVM8P6eUqv/8iT+bF1L3cAoIyV
	mcOcrqLl4B/viTgijGdCG766/xJpiNRgFVMYNF0lzrT/AN6FDlD4AkRadhg0O7F7aChJDjxkBsV8j
	WUCr/sEsQVZ2l4/wgy+LMxQW5qkf29ZlRoe6FYM7cPBT0ZU5YojAqRh2QLU4N1kU02Tg0Z4ak9Oew
	hSi23hnhGXV39p+EacJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbUJG-00000004Ih8-3ova;
	Mon, 22 Jun 2026 02:22:50 +0000
Received: from ms.asus.com ([103.10.4.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbUJE-00000004Igm-2EkQ
	for linux-i3c@lists.infradead.org;
	Mon, 22 Jun 2026 02:22:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asmedia.com.tw; i=@asmedia.com.tw; q=dns/txt;
  s=asmediacomtw; t=1782094968; x=1813630968;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version:content-transfer-encoding;
  bh=KnodaR3et15Yj8h1hcQH+Cyk2J1ed4H42sSl6JaOokE=;
  b=LzJXO/q5yUYYAaTaXXYXlkqCZEl3zJuOQgQquvw/mQ64IXmnmgmEuy+s
   6QM3pVbBA1EXIbT1HFNJm4sZaRLcAIX3KjDDZiiOGLK1ZRmi8MWuA6AEd
   ROgYYOeJBJHqbANyVlqqr0402m2GbI47RMNqWFJAfqdsZEOuMr/dfN7eN
   A=;
X-CSE-ConnectionGUID: Gi3zMA2TRMiSlIFHUaEzkw==
X-CSE-MsgGUID: uSDYiVLfSNKcG2Dh8ohGkw==
Received: from unknown (HELO APZA005TMD.corpnet.asus) ([172.22.47.65])
  by ms.asus.com with ESMTP; 22 Jun 2026 10:22:37 +0800
Received: from APZA006TMD.corpnet.asus (172.22.47.66) by
 APZA005TMD.corpnet.asus (172.22.47.65) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 22 Jun 2026 10:22:36 +0800
Received: from APZA006TMD.corpnet.asus ([172.22.47.66]) by
 APZA006TMD.corpnet.asus ([172.22.47.66]) with mapi id 15.02.2562.043; Mon, 22
 Jun 2026 10:22:36 +0800
From: =?utf-8?B?Sm0gTGlhbyjlu5blu7rpipgp?= <Jm_Liao@asmedia.com.tw>
To: Frank Li <Frank.li@oss.nxp.com>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?WWQgVHNlbmco5pu+6KOV6YGUKQ==?=
	<Yd_Tseng@asmedia.com.tw>, =?utf-8?B?UGF0cmljayBZZW4o6Za75oay5bu3KQ==?=
	<Patrick_Yen@asmedia.com.tw>
Subject: RE: [PATCH 0/4] i3c: mipi-i3c-hci: Add support for ASMT I3C
 controller
Thread-Topic: [PATCH 0/4] i3c: mipi-i3c-hci: Add support for ASMT I3C
 controller
Thread-Index: Adz/CUSG5Xi6wWEaTgCEIqDS0qn65AA0mC+AAIQu7XA=
Date: Mon, 22 Jun 2026 02:22:36 +0000
Message-ID: <8c04b80615c647f7a6b60e75d3d5c80f@asmedia.com.tw>
References: <f43667a6eff54729a06aed3c23877c01@asmedia.com.tw>
 <ajWTJz4oIDU5dIiC@lizhi-Precision-Tower-5810>
In-Reply-To: <ajWTJz4oIDU5dIiC@lizhi-Precision-Tower-5810>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.78.106.71]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30022.003
x-tm-as-result: No-10--9.041400-8.000000
x-tmase-matchedrid: SD3TfnVbAUofHU5fltg9RiyIz3xZbkbD0swyltiO/TuRnjfvXVSKt0uO
	kOE/Vy/rd3WaQ3GsfAEee3W6j059JO7F68qEGD1WrdPIcvaPIfY4+taAy0d3a5BVub4dryB3BBQ
	BKSVCNK8F/6guvbJCTQb2QzYoEKG1jWDfMO3Wy/kMcdUVpjQtQvAzy/g+vdT/M6E3dEajW/UlTS
	cbe2l74JsI6K9TYesL5o4up6otKKxCVmjGJJ+P5HwlhGLby224xbk/8klUDv7+mCyV6BiuzXT2v
	pDl5fhm
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--9.041400-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30022.003
x-tm-snts-smtp: 5BC5FB2A2D6D2B218EEE46B751FF86C9E4F7743A5E1DF133685D6E16627EAF442000:8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_192248_866402_E7D43A17 
X-CRM114-Status: UNSURE (   6.10  )
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

Hi Frank,

Thank you for your feedback and guidance. I apologize for the improper format.

I am currently conducting an internal review of the code and validation on the latest kernel version. I will resend the patch series using git send-email as soon as possible.

Best regards,
Jian-Ming Liao

==================================================================================================================
This email and any attachments to it contain confidential information and are intended solely for the use of the individual to whom it 
is addressed.If you are not the intended recipient or receive it accidentally, please immediately notify the sender by e-mail and delete 
the message and any attachments from your computer system, and destroy all hard copies. If any, please be advised that any unauthorized 
disclosure, copying, distribution or any action taken or omitted in reliance on this, is illegal and prohibited. Furthermore, any views 
or opinions expressed are solely those of the author and do not represent those of ASMedia Technology Inc. Thank you for your cooperation.
==================================================================================================================
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
