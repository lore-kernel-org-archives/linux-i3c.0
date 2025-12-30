Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64952EE4982
	for <linux-i3c@archiver.kernel.org>; Tue, 30 Dec 2025 16:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h8x5oCxFM8VwUKr0jDoYygVvgTTbXZknAhbpWIfL0Ok=; b=T0pPwLkG7tm8Yy
	dfctO9d21gZr/JLnjo2EUML3RjjF4Sll22+dAS6UXRhvNVQHfCs4UfM+7v3yMuNeNIychOOGgl7VA
	5PDUrQmtzQRhrj23qZlUB50AQWHwMSuqmdFy3fOLDGiPuhtTOaJm4FNrWhPDNh73reH4Qm3NIuEwp
	uqhJtkeyi9ZJJ8Dm+61jIBdqkybFJ+qKLH8jMJrOlNIQ0iiMiD8dSFrgAJhfful7aE7EeCilCBDJv
	22EPzDJq88o7PDi6OLoovv9Lkah45Mh01C0bmlUbdqntuxhKNwCJ38qRX3OVmA844EdDvCvIZu9wp
	kAJlJtufeD7Q6P9tk3Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaca1-000000053Yo-0XIC;
	Tue, 30 Dec 2025 16:28:17 +0000
Received: from mail-japaneastazon11010056.outbound.protection.outlook.com ([52.101.229.56] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vacZy-000000053YL-2Wpj
	for linux-i3c@lists.infradead.org;
	Tue, 30 Dec 2025 16:28:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6rjbHWxWQOUQidz4q4/V5QnXKi2i06uwyhDlm4qKcOMa7M0Tm8luYCiNuAPWlut2i6Lr8R+1fR7pRw5VGS6NIWw9zXitHrLzSjuND5fGUW/vJNUqYWWLPFRdpN+L+U4JzHNoor3eMV11w1YwPhc3QOo3h/KXPkBt3GkXP5TAu0zwgLhbBVsy5EnWkKqX3dCpkPGRlNQU/+yE19lTmqFkzCx4JdIroHUh0QcYKUw0u+Ppmc22FcfZ7AVWgr/D91vIKlnV18lwH/OP3g5o6wF3mY4C4JbA1E4VKi//RizxCvSpEz19BtQcoxNLrFXN5/cfwIxnon1T8z/3ocjT2kGLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APGQg3RhKPuk4g9qx+xfg127t1nUV8hXoW46pvZ0ynY=;
 b=kCa2zx71lRO+vO6CPxpfisNi6gHQuydfA7+PEJgwKm8iaQ044cKCOoTc7jzNkpNRz1apv/1T/fmtv8QVQc01KkmAk02tbA+MYRQGKs1rV5MPP0YCPepa//J8dU7nFpMpgJIyFmyhcbx1tv/XynOb6SWtx00kSvfz6AJYSWVKYSI9XukXuxhbKgAmwPlvO/e7fDbou3JGlEeq6f/mC4Gk7rYxHzPlZiBKBnSHPmO1x+TcqbihLfl71FIP2CVdWuiNulKVYmc+an5rdd9M43DlG8h4bOZP9ExBLi0F0dzM4tQcSXFRM9GrejSne35tf6o2EEER3uxoUImr3iw4rBNKOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APGQg3RhKPuk4g9qx+xfg127t1nUV8hXoW46pvZ0ynY=;
 b=J+klxD8UgHhMcXVsihbw4I3K949SFVIJWLAimj1OO4POphikexarCmH3r6pXdjRCVqD0sAiCs6wpMDr+wZje43+TgJTO/Q01d5Dq3yBuVIfY/DcpMshUVg4MqaIV8mwh0gkqzUP7zav9VSpVBroCT2me/kI+g4L7JKv7jj26emU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB16231.jpnprd01.prod.outlook.com (2603:1096:405:2e8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 16:28:10 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 16:28:10 +0000
Date: Tue, 30 Dec 2025 17:27:59 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Frank Li <Frank.li@nxp.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] i3c: renesas: Factor out hardware initialization
 to separate function
Message-ID: <aVP9j0c5lbfgRWlD@tom-desktop>
References: <cover.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
 <c93219af1fcfc461a1b072df0289c291a37c45bb.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
 <aVP0LV3K07ciFR+e@lizhi-Precision-Tower-5810>
Content-Disposition: inline
In-Reply-To: <aVP0LV3K07ciFR+e@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: FR4P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB16231:EE_
X-MS-Office365-Filtering-Correlation-Id: 5857cbcb-7c15-4568-b3f3-08de47c06b8c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oBBlCI8FAJzpefIO9ax3R2mvC68i1lLEMxEMoCJal+ud8WnneKBxTfYJsJj9?=
 =?us-ascii?Q?B1HATuiFcodI9W/xTuj6gPSfh1IeIIeppoXcl07fgdGm3tL+ThjwCUOp7jpM?=
 =?us-ascii?Q?Tf1pKUWn3L3RTJFgtXt4s/XP2BNcvwgmnxHpIzq909wSjRmgJbFsI3OQ5df7?=
 =?us-ascii?Q?W0Zufzt3G4eLov4SVIP7M22Rsqp2P9DrrHi/bmyHA6vE7J9dgOivIqyNwXdX?=
 =?us-ascii?Q?QcL/8Wi0St3whv+FN4bMQTChWidbXpIjRjL3Maor91lXr87gzAk4EjSlwgxB?=
 =?us-ascii?Q?D3WcI+xbw7CazB5sLM2IRHHoUQhfXL4V3VAkLvlLlWB7Z38fZY34/FDYg8BN?=
 =?us-ascii?Q?ToX8vTp1+GTvvW0ygJFojHjaxFZEE+J1R2BkgKj7G+dzj6UF30STv/6eePSk?=
 =?us-ascii?Q?RCC8HPLuloRNV9q3CYmgwVpjRVkX7pwL2oTVcd59MIBT3yVe50VyCKBNugu1?=
 =?us-ascii?Q?zUVL/DQHm7Mmr6aUnHixFwT1nVB1rMLp9zAMw05oXwTROSpQ2/Wzkp4iESGd?=
 =?us-ascii?Q?IFsC4a6snLnfMkyrF/KHGz9GCbuXrElK/qUFwK+MxYZOJuWU1Gtf2GkXe5ik?=
 =?us-ascii?Q?RodyJ69rMlK8/ATrFe4hHMCr2EpvSHiCPG8GGM1gn0l5OtPibQ+YjzgtlKCg?=
 =?us-ascii?Q?imiMrJyq9bGbNtq3vfMErSdSQr06mrv5HIZRaqq6FUJGeHhSlcMo+50+t/Ya?=
 =?us-ascii?Q?LmX/VsOY6/Mx0HvlLvgd1paNPThgYMpTPKCKlY8/dvWDg4TbApL9DH9QAJSP?=
 =?us-ascii?Q?HQjYzaqakO0VSt1tFLICdydkGGRdVg34TlIXkcntW1bGuNkOsTzaV1amxn2b?=
 =?us-ascii?Q?XmT1vx0Kjt1dTX0Ur2jyFkSlS2HDdzyKnhekatSPjpcx/urmV9OzjyPuUDnv?=
 =?us-ascii?Q?oevnQpkROoCcQYAPuaaU2lbLmnXcElMsl8RlAOZOZdOmlWoRqskNoCeQkZRR?=
 =?us-ascii?Q?d6YRqIevk1lRdCvXCWRlC1nCzQ+ej1/UQ++KQojHe0tpkXZvA8dTk94x6QSY?=
 =?us-ascii?Q?IgG5n7ZeSguGaI0blcmwHIwGw7V3SHwsxcAsbVHOXa4dCcBpIm0PmqC0BuRC?=
 =?us-ascii?Q?hpoGHg0HlMgx/7/6OzpICB++FcmlOCs+S4yA76wV6rIr0hFgRYJKwObqHObr?=
 =?us-ascii?Q?t/P6HvEwK6y56gRc8ipLYoVYmnHG6V1ACept0SsqLR5WroMOXF7ioCy0dIPq?=
 =?us-ascii?Q?tU1Vvkh3JmGtWlawEnODm+War2esja7mjJ9JSkGQL4GUkN3ZZYGVEuHXzCgK?=
 =?us-ascii?Q?AK7gVVutU3ag2nRAxhmksX3MlXb6rYhl4/WTELhnDfDSj+cABXT76FMHA9kD?=
 =?us-ascii?Q?x8an2NBiVu8GagdGs+S7KDGceNfYJ1tdprvVjGJ0YvmhWntndv4B/73pIbI4?=
 =?us-ascii?Q?cgXTj5xAULRZPZ1+tvAZvaoueTiWWJz8fENLdZctJw9y3N8pUogQHoY60vnn?=
 =?us-ascii?Q?L3Vyqq1IGFTkZwtmHKr6Y2YoDW7iJ9EHjTAQy2zVFHybVlfifk/OLvsZqYVZ?=
 =?us-ascii?Q?4teIbaCFT1LjKLkd490F2aD8FdEhHm6NE3tG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w3GtHDd0t3DPbWszdr39Jkl9TxSMl1eB0/d1U+qjxqr76E542VBU4xuo1Rfu?=
 =?us-ascii?Q?dWymJqip2H/W9pnyq1URitNNecH+WQMjGwliORJStbzvKqFpC19GCN+ArqQV?=
 =?us-ascii?Q?RLCPnnlZt6MFDkC/MlPpdSo2vJb6VRfdXM/w35o/UPtUG2UQf2/XVhnT6zfJ?=
 =?us-ascii?Q?yYOVYzx6GydakLaiWfS4kqltzOBXY/VJzvlGfYZyGCxxriK4yyrmh52CviOl?=
 =?us-ascii?Q?Mi0bf0njIkQ6nbW3zY49digMA8X/CltdP9aFCSHCujFJRAj+5yAVfFYZyaKE?=
 =?us-ascii?Q?J8E0DMqFVERBlalhAS383C333FuuWqHL65p/N/ZKJDw6KMVxTR2AwBB3xbnH?=
 =?us-ascii?Q?EQjDcOrAdJ8hXFHDR42O7Vz0INpwtNOyWRXls13CXrNSEq0X6SabTd89f3ig?=
 =?us-ascii?Q?SmBI8Byp3d1Lds/l28IJQleP/WHkadQHJzlaYmfL04kHk/5KxccS3UkZHmD8?=
 =?us-ascii?Q?//HqfMXLJZNWXnm4Vip2hcbPBCLGsABS/xW6i3OZV0jHn+NF7LY8aizNkOIW?=
 =?us-ascii?Q?gkSZJvTWIVmdnX9N1U6iI1SnfuyKowryfLFAPux96noHEA32yJUBLMAk8EAx?=
 =?us-ascii?Q?SRo+xvY5sEf2GcQR5eAflp5iSJ32beKkNqbHMBdviTTli3SfAYb8e+GRSoVK?=
 =?us-ascii?Q?wFF8lhXCsx0Gjsj1eLF4NOm96ZhpJBeXmvmfKCRvEm+UiroMsWh8swdvIqDh?=
 =?us-ascii?Q?mqsFMtu3dbm95hlM+B7xi50RycvPdg4A3B+aGcUSKHPBu+IqovHABejWqy7T?=
 =?us-ascii?Q?2LNNuNXRzjG9cPnuTUqAzYQwPlKV45l6Ja/ukT0AUI8vKOm2rz26lyzpObZ0?=
 =?us-ascii?Q?ira7qowbLE7KU8qHyb+3Jy4k2kMRIiW1FSxquAUi/jTDctSnGDQ3bKoNJW7v?=
 =?us-ascii?Q?1LfQ30BlcNFE0lapywK1ST974Ol2/hESyv1LF0alFZPgtG49y4Z30dhgbjfA?=
 =?us-ascii?Q?Vs4Wzfvzzvu2e36m6cjhBMQgQ9IaTINvOJ/BnOxR7dp2y8fHyLiztlrw0vl0?=
 =?us-ascii?Q?bKPTs8BT/QYVdYhLxm+0oE3d43/BniSZZSySkg/sBfyUh2uw+aj8mW7hlpQZ?=
 =?us-ascii?Q?pFAclRDgMjUzjvxUREbrIt848oXAvdOSWpKaqAOcoBl9YkrQ8D6OCcJxf8eA?=
 =?us-ascii?Q?HxSiS5kDWTvIhAW6I3CFTeWqAvhWw864SFZqF8DZD++bPh3ikUq5a3wK/Nhk?=
 =?us-ascii?Q?OJR/8vUCzIpdwkK+dB3oq2N8VhnohfQyBtNBXm7DuCacDidfJokZj1PfUYRs?=
 =?us-ascii?Q?qrQh6hPCe8DkGowH0w/8OIvMiBR6HE2fzNM7jtehQZd74BOta0ONV6feh3pn?=
 =?us-ascii?Q?X9fldWRo6Y8pmGOK/G0xRLprtxm30OAt0frH2uspbmQC07uUNHnGvzddaXHx?=
 =?us-ascii?Q?nHvnMhvR2mbOZQDHJdCNTgVR6znLCrypyra4IWluUpEGV5ZDoSGeIjflX5Mk?=
 =?us-ascii?Q?AeRhzaEFVZdCOcFv4iKIEIz11xtciMTPhUYn3mddCRPmUrK/0f5c6zpgxBzq?=
 =?us-ascii?Q?/L2sg+neq3qlwKhstbFRoUL6UL1/jWU7GTvtDIPyzK+Zi+8Qh/gbACzt3q15?=
 =?us-ascii?Q?INvr3PCmUp3V5eK/kHfsACVUMSIwvcv5GHvUwzJtcJzfHIwRVEdBVZJtGblw?=
 =?us-ascii?Q?lyBrzSAYQNT9Wnj53TH8d4wzJ9PlTRKLK6UfYt5Y5us91Xiloam07JEV0TFV?=
 =?us-ascii?Q?3gBXFSk8mHEqdqlbqp1lj/DNPFx8WA/ygmZiL6VeV4UtbAreyBUiFGF8U1H2?=
 =?us-ascii?Q?e32PPwg40LLHaSGr4EtyD9WpVw2GaE0ELwctcq6JmctREDybOnyw?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5857cbcb-7c15-4568-b3f3-08de47c06b8c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 16:28:09.9772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOZrHbmjKNktfJApiuLayzXPnB+qGSzJt+7SVGr+AJgNzUV6qsNzLHLOFbvk7Dyr829yCvS3KXLAuOKKpT611PSIhPO9MGPTdA6oRD9BlxzYr/7zb5PGooWLTtnosYo/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16231
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_082814_751469_D26F835A 
X-CRM114-Status: GOOD (  20.82  )
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

Hi Frank!
Thanks for your review!

On Tue, Dec 30, 2025 at 10:47:57AM -0500, Frank Li wrote:
> On Tue, Dec 30, 2025 at 11:39:38AM +0100, Tommaso Merciai wrote:
> > Move the hardware initialization sequence in renesas_i3c_bus_init()
> > into a dedicated renesas_i3c_hw_init() helper.
> >
> > This simplifies the code, and prepares the driver for upcoming
> > suspend/resume support.
> 
> Nit: Simplify the code and prepare the driver for ...

Will fix that in v3, Thanks!
Will fix also Patch 1/4, 2/4.

> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Kind Regards,
Tommaso

> 
> >
> > No functional change intended.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v1->v2:
> >  - New patch.
> >
> >  drivers/i3c/master/renesas-i3c.c | 99 ++++++++++++++++++--------------
> >  1 file changed, 55 insertions(+), 44 deletions(-)
> >
> > diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> > index 2736363c9074..4f076c372b36 100644
> > --- a/drivers/i3c/master/renesas-i3c.c
> > +++ b/drivers/i3c/master/renesas-i3c.c
> > @@ -485,13 +485,65 @@ static int renesas_i3c_reset(struct renesas_i3c *i3c)
> >  				 0, 1000, false, i3c->regs, RSTCTL);
> >  }
> >
> > +static void renesas_i3c_hw_init(struct renesas_i3c *i3c)
> > +{
> > +	u32 val;
> > +
> > +	/* Disable Slave Mode */
> > +	renesas_writel(i3c->regs, SVCTL, 0);
> > +
> > +	/* Initialize Queue/Buffer threshold */
> > +	renesas_writel(i3c->regs, NQTHCTL, NQTHCTL_IBIDSSZ(6) |
> > +		       NQTHCTL_CMDQTH(1));
> > +
> > +	/* The only supported configuration is two entries*/
> > +	renesas_writel(i3c->regs, NTBTHCTL0, 0);
> > +	/* Interrupt when there is one entry in the queue */
> > +	renesas_writel(i3c->regs, NRQTHCTL, 0);
> > +
> > +	/* Enable all Bus/Transfer Status Flags */
> > +	renesas_writel(i3c->regs, BSTE, BSTE_ALL_FLAG);
> > +	renesas_writel(i3c->regs, NTSTE, NTSTE_ALL_FLAG);
> > +
> > +	/* Interrupt enable settings */
> > +	renesas_writel(i3c->regs, BIE, BIE_NACKDIE | BIE_TENDIE);
> > +	renesas_writel(i3c->regs, NTIE, 0);
> > +
> > +	/* Clear Status register */
> > +	renesas_writel(i3c->regs, NTST, 0);
> > +	renesas_writel(i3c->regs, INST, 0);
> > +	renesas_writel(i3c->regs, BST, 0);
> > +
> > +	/* Hot-Join Acknowlege setting. */
> > +	renesas_set_bit(i3c->regs, BCTL, BCTL_HJACKCTL);
> > +
> > +	renesas_writel(i3c->regs, IBINCTL, IBINCTL_NRHJCTL | IBINCTL_NRMRCTL |
> > +		       IBINCTL_NRSIRCTL);
> > +
> > +	renesas_writel(i3c->regs, SCSTLCTL, 0);
> > +	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
> > +
> > +	/* Bus condition timing */
> > +	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS,
> > +			   NSEC_PER_SEC / i3c->rate);
> > +	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
> > +
> > +	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS,
> > +			   NSEC_PER_SEC / i3c->rate);
> > +	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
> > +
> > +	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS,
> > +			   NSEC_PER_SEC / i3c->rate);
> > +	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
> > +}
> > +
> >  static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> >  {
> >  	struct renesas_i3c *i3c = to_renesas_i3c(m);
> >  	struct i3c_bus *bus = i3c_master_get_bus(m);
> >  	struct i3c_device_info info = {};
> >  	struct i2c_timings t;
> > -	u32 double_SBR, val;
> > +	u32 double_SBR;
> >  	int cks, pp_high_ticks, pp_low_ticks, i3c_total_ticks;
> >  	int od_high_ticks, od_low_ticks, i2c_total_ticks;
> >  	int ret;
> > @@ -564,49 +616,8 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> >
> >  	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
> >
> > -	/* Disable Slave Mode */
> > -	renesas_writel(i3c->regs, SVCTL, 0);
> > -
> > -	/* Initialize Queue/Buffer threshold */
> > -	renesas_writel(i3c->regs, NQTHCTL, NQTHCTL_IBIDSSZ(6) |
> > -					     NQTHCTL_CMDQTH(1));
> > -
> > -	/* The only supported configuration is two entries*/
> > -	renesas_writel(i3c->regs, NTBTHCTL0, 0);
> > -	/* Interrupt when there is one entry in the queue */
> > -	renesas_writel(i3c->regs, NRQTHCTL, 0);
> > -
> > -	/* Enable all Bus/Transfer Status Flags */
> > -	renesas_writel(i3c->regs, BSTE, BSTE_ALL_FLAG);
> > -	renesas_writel(i3c->regs, NTSTE, NTSTE_ALL_FLAG);
> > -
> > -	/* Interrupt enable settings */
> > -	renesas_writel(i3c->regs, BIE, BIE_NACKDIE | BIE_TENDIE);
> > -	renesas_writel(i3c->regs, NTIE, 0);
> > -
> > -	/* Clear Status register */
> > -	renesas_writel(i3c->regs, NTST, 0);
> > -	renesas_writel(i3c->regs, INST, 0);
> > -	renesas_writel(i3c->regs, BST, 0);
> > -
> > -	/* Hot-Join Acknowlege setting. */
> > -	renesas_set_bit(i3c->regs, BCTL, BCTL_HJACKCTL);
> > -
> > -	renesas_writel(i3c->regs, IBINCTL, IBINCTL_NRHJCTL | IBINCTL_NRMRCTL |
> > -					     IBINCTL_NRSIRCTL);
> > -
> > -	renesas_writel(i3c->regs, SCSTLCTL, 0);
> > -	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
> > -
> > -	/* Bus condition timing */
> > -	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / i3c->rate);
> > -	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
> > -
> > -	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / i3c->rate);
> > -	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
> > -
> > -	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / i3c->rate);
> > -	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
> > +	/* I3C hw init*/
> > +	renesas_i3c_hw_init(i3c);
> >
> >  	ret = i3c_master_get_free_addr(m, 0);
> >  	if (ret < 0)
> > --
> > 2.43.0
> >

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
