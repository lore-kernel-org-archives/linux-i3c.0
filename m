Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3548CD8C9D
	for <linux-i3c@archiver.kernel.org>; Mon,  8 Jun 2026 17:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0kIVDLGippTQPeScQMwrw9p5FLyjMJYxELFrP82+ZE=; b=ouVcLq8kMdUqaf
	R7+mjHGn9nym5EcFCkZYFMSM8hQRrt+fHbsaQtPUXunsy5bOBYSzTMPBXhjvVlX+y5p+DTMlZ3LUx
	6K7SoaaYEnmSzldVgnJYewadzZOvtZhoVcKBPoYafuzjDA3ROFLGElddJ+kxlKDeeSefbFo0ddRmQ
	G4uKh31ucjh6tPtE5ecyBwHCoZ7LkjwEasz5rRe6B6kE3oG0hFYvBKRridRYckcZIUVxVo20MRYyU
	IVdu/7XZT+7ojf+ZbaV3FIGOIUaDZa+r3lKLFbqgY8tJlWZSIxVw8flFvt6CIaHevCx74hYH6CX4K
	dos3XO/uvkhV52zg8AXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWe64-00000004Dif-3663;
	Mon, 08 Jun 2026 17:49:12 +0000
Received: from mail-swedencentralazon11013050.outbound.protection.outlook.com ([52.101.83.50] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWe62-00000004Dhu-1Pik
	for linux-i3c@lists.infradead.org;
	Mon, 08 Jun 2026 17:49:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJ0kDwOSJ9cjMWnhAKqHhPwpTAHFLn4k6N/4G20Af4EMOacyw2ebCzrqeKTQVw3hlUzq/tmdWiizF9otZ6NfaqOuFWChJqfL3bMlsxJEwbtzA78yeNEutQXHcKvHKVhUcjXT1z8EKKql2GKzYpLQ9zkd1b1ebQcOe5hJXLc6QbJoAkA/AxxilQ4DFMRAg3NEOakdVNEaNDF4Ji5xbx3MjKDVqYhMO+FK8oI3OdMmH5xz6CTqe8ZqYeepZMySWSG6LuACc0eWy4qB5iiuKulpUrMaP0jP6HLIAo4ZzSO3g5Jok0HMo0JlcJ+AEk7JttJqWcAytApLaRtz/qtlVKSccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJhnBtc0SeO5AVgu/XWI2zTkSLhNeNoDFkjhw/QNp8w=;
 b=YOpnpbcWQYkwx1R/gR7YM5gP6Wj3nSerummR713wzIsAS1Ev8l/U7b5j/6vzmYPGqssMOPw0+N+qi0BqTawkFNgr57Zs5S/dVc1uPlKujzn8ckKvLQfiP/UsHMpVyzSRHtaiLTGVW9wafZLnQXwWKiO+7rTkyl2UxTvAgXESh6w1+UFDGqKroKeF9pxUgqJ7gO9Y9h79S2ALM7hbroevajQ4vgAbraY9cl50b+Yo5sH/dYflDzhnOBEggHMDRiimSnalFxdw/inEqQVY8FI0+929cO0Zhl09DovNjbXVs8zDhYZ6cR//Ol5v5FRexnH6jE6SqMtWY124FYp5rrdO7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJhnBtc0SeO5AVgu/XWI2zTkSLhNeNoDFkjhw/QNp8w=;
 b=HwP0+OFFKoRY70J+GELxyYbDqzmVtkEBqyYky77Tv8z1tpLaZ5REFT+sr6lBSqOpCkri2olBELsLMBFX4ID9CmUQoucVGV936ucyPM0+3zCqDRrlIHe5SiZIL/H0pAKFQmdnmKtXWxqHPvfE+gTRcHiEYI3bGfCia6Zwf+KTO4uplCW1WSp+s++v/nClxYk7xfyRVszcXc+SNyLlPDRRX75/APdOyYuG/a9TFbdSZrVrl8W77AGlXn0n9AVbjJmCFbtUdMW6odGMd9iGdH+z8IBVyDvwvhLUWm3dmpElbXrHdXZBstw3DvnfecwndwOJ68j31LjB3hJmB4hSf5HrrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VE1PR04MB7262.eurprd04.prod.outlook.com (2603:10a6:800:1ab::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 17:49:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 17:49:03 +0000
Date: Mon, 8 Jun 2026 13:48:59 -0400
From: Frank Li <Frank.Li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 4/7] i3c: mipi-i3c-hci: Tolerate
 i3c_master_add_i3c_dev_locked() failures in DAA
Message-ID: <aicAiyutxqQ0b5SV@lizhi-Precision-Tower-5810>
References: <20260608075801.16111-1-adrian.hunter@intel.com>
 <20260608075801.16111-5-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260608075801.16111-5-adrian.hunter@intel.com>
X-ClientProxiedBy: SA1P222CA0040.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VE1PR04MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba872f9-2fc5-4dae-1c62-08dec5863a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: qY8VRodZGUywzVxUNbk4Q7r/l1tZG/Go9jrd0MZ5w+BPL39gekoUmLp0mpIUd4pGRu/VvC/TwbZZrO6ZXC2OjRNSZ4rICH1jyA7M5zHYhfXyPVv/iT9jF6brJ67QgdhQfmdHm7u9hlna5iFhKS6hPgaHlMlyS/Qzzzw+UibJWoLPEWvscowb15I8NUHS/gKX2fScgjD/Wf8bg3lt3P9rNnyT/w+ZBlxj7vwPcBVMxBPYyBbVCOpRoLMn/QsCtib9FOzctuVLROZ3p27uFTXKMEh+2GrhdFwXs8SawhyDjOlyOp8t2jl0XifqWmeVqRP8kjbJJjDRl7Q/Z09k9c3UpyIYE1nY5FHIdq1wPu/Pm5fA+aefLVT8sJWt8dgeAOUnSUp4dQEd0Ofp4VP5Yfi2bu1zGPlAeuPcBzi1ybUBAp+uviKbGxSYVk/0W3sD7kQYCRPTMh7SZWsw/IYjeaGv2DvihQNahScF4+ExPU0GPBtl0I2B0CpGRY9XENqPMwOHH3Wi5Eg9Ijn3vYfNJFPuo62HRK240tKeaqr7k5ivyv4SwGhLcPNxHXZw09Mv5YEDi8Y2qWZPJqSMDCJ1/13W7vbBfUag3+ydPcbxMT/d7T7p6ciaws42X28QCKVF0tCZW3D6HdiOeRsAmAP2wSl2hsaYXw9HfsV25dR7722gXjbUVUEcfsyL44kc31l5Uq+K
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hKQ7+NKbeSZKX5KNNKciACBnnpN3aHb9nKJn7k+H5UyzPv0Kg8w6qFz8mIrb?=
 =?us-ascii?Q?hcSghQzUltWKn+cTGRRFYJYTB2gWwrRDoBdoIr9erIZUOc6a9ikeYh6UadP0?=
 =?us-ascii?Q?wcyt9IudKAEsPjAqEr6RD+Tywz6fUT7++HmINNKi3n3qPH8AasPNlHgJDySW?=
 =?us-ascii?Q?CflbYHZ8Z7kXR6coqJJq5ayShFop+Tf3FZAnc+rE8EqWjlhhjLwKxbf+SW2k?=
 =?us-ascii?Q?8A8dg15KRuNi/oDYbf79gYWKUOPeDnxMbmxb5vlM46tN+KLNbymZA9erGTSa?=
 =?us-ascii?Q?l+v/+tmjUkWoQlCsHdUd16t4cjqxY0yc2gdHzySZsRP1Qd8oh5lgNVUYCksY?=
 =?us-ascii?Q?0wAOb/YpV5iEQy5HidvFCWgyIinIy6dApU6q+o0gPP3SHB/seKhCm1zg1IG2?=
 =?us-ascii?Q?d096sPxu6mUdMrRzdWUDgPTr6jeFI2CZ5BUGA7jVEdIYcQlRlti28u3QoWrW?=
 =?us-ascii?Q?Zd8He/XEoDRkhSp+9zMu/UYMy8F5zjSkvkF2fdEWx1JHOR6FqI4I5RBj4Quv?=
 =?us-ascii?Q?1uwa7hOGD77/OBUko7kJV/t9n3WkquQRR+4W6mYvbscfr/TfsE+Ok4176VmD?=
 =?us-ascii?Q?yH+l7uz3y8g10X257JLJy2/HQ4X+5hcVxwGq4a7CgpA1SxOO14HMOf8rTiKr?=
 =?us-ascii?Q?KTC2l8Z0m4PDUVfSisPtEE8j8T1QblsI6xLGKBEqNieF1VD7t0U9u5CdC/7O?=
 =?us-ascii?Q?C5itjqiz3bGwLYCLG3FhUlvOPCikJskNf4O2YizbVUwfTQ8jg4v4x4uSamyx?=
 =?us-ascii?Q?FciQvb6gtAiefgMiPW5Z5vYxXeG2Pz3qqxEJFcUm0usO94Y+ize21WdG+i7F?=
 =?us-ascii?Q?9Z8mKS00xYmCGfne32Q7XwlmhqOSJjb3TGAtBs7eYtMLtMenww+TdAnJgwTn?=
 =?us-ascii?Q?Cd8fkqWY3lNcuQwMk6ndb2YVyZutc5jRlLboAH8XHGIQpQgrZNTQa4UQHhyE?=
 =?us-ascii?Q?NebmTXeWAYjwxZxHdqVSMeXJI6eOGPHciSz/uGXZ6Gu3RZNYGhDi5SPaBtVV?=
 =?us-ascii?Q?6yBXbfMcRUuiWsmreHDYfLqB/wSDRWFRf0QaO74VA36iFGgdC1PjqloVttbz?=
 =?us-ascii?Q?p3jn9cDt6B9WV47agX+ofu00m7GPmZq90OBbY6RD7XItX53cR3WEzTqYJezx?=
 =?us-ascii?Q?6RhBCuMOK07p2Nz7SdAwDoM/ip7cTPN4JK1F6vpYWt5pLUca69PKPNEPiKQ3?=
 =?us-ascii?Q?QadMyzJFQULZhX2XnqIJsm02VRb587a9XiUdgIBh2tqXIHihWquDboDY1VoF?=
 =?us-ascii?Q?IYxFuITKy8+h0eR8K3hiEWnWCbTdOEjctpojHltvtBd1hMK+1V8WNLHAlWfE?=
 =?us-ascii?Q?R+joLgasSqfAEnYQgx/Sv7E4ShgRGM4+BBc8jeuBa4tYC4Deq67MdusfgQHH?=
 =?us-ascii?Q?ZH4hLuaa/MjO0V4IP60dCwGMSGbwW8P50aQFw1ZZ4yADtwBDH5B1extD4V62?=
 =?us-ascii?Q?gLWdcI5XYOd/NkoJ1lrHx6pPwHAKUELlwEb4a8oOqGT5GCxkkzjteQZnjLIR?=
 =?us-ascii?Q?dTusofUgfnnbhcqSnMRlMqxdAeo/UNjBBjmDphaj6JP3RSXbJa/N2yQIV/0H?=
 =?us-ascii?Q?ZVpANE9JED2MuBOvXkoejzn5hrzPS0rz6fhkSIjHo1snVDanPn+g//Urv/kw?=
 =?us-ascii?Q?ZfDEBzBZ2d4gU1EMsqe811/R8afyBpwh9NtJewNQ/5nOje1wWIJoG5lT/QKO?=
 =?us-ascii?Q?B6+w6nvVoCWcL54zqfSdL5ckwybJ2kitQ4DkLicd4ejIgY8sdpJCdY4MA5M+?=
 =?us-ascii?Q?gUQUz6XhoYV+PGo+WJgsJMUTlCRsbqEL58zvYIK/Tk9Ygyatf3bL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba872f9-2fc5-4dae-1c62-08dec5863a94
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 17:49:03.4359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUTY5C49Vz+NQv1SCG3XybuSSkuWkntFFhTkXRV8XYvu276+4om/EpNP8KrzxZJJ3M+/c9y9qdeT3y2K4exBRzPq5qrY3b/+lDDAiZe1HkKrEa1cGR7JupAREnlSj4pk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7262
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_104910_375871_922A99FB 
X-CRM114-Status: GOOD (  19.19  )
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

On Mon, Jun 08, 2026 at 10:57:57AM +0300, Adrian Hunter wrote:
> i3c_master_add_i3c_dev_locked() no longer leaves the address marked as
> free on failure, so aborting the DAA sequence on its error is unnecessary.
>
> Failure to register a discovered device does not invalidate the entire
> Dynamic Address Assignment (DAA) procedure.  Align with the behavior of
> other I3C master drivers by ignoring errors from
> i3c_master_add_i3c_dev_locked() and continuing enumeration.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>
> Changes in V2:
>
> 	None
>
>
>  drivers/i3c/master/mipi-i3c-hci/cmd_v1.c | 4 +---
>  drivers/i3c/master/mipi-i3c-hci/cmd_v2.c | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> index 75d452d7f6af..3b9345718d27 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> @@ -358,9 +358,7 @@ static int hci_cmd_v1_daa(struct i3c_hci *hci)
>  		 * TODO: Extend the subsystem layer to allow for registering
>  		 * new device and provide BCR/DCR/PID at the same time.
>  		 */
> -		ret = i3c_master_add_i3c_dev_locked(&hci->master, next_addr);
> -		if (ret)
> -			break;
> +		i3c_master_add_i3c_dev_locked(&hci->master, next_addr);
>  	}
>
>  	if (dat_idx >= 0)
> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
> index 39eec26a363c..8d93748e858d 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
> @@ -296,9 +296,7 @@ static int hci_cmd_v2_daa(struct i3c_hci *hci)
>  		 * TODO: Extend the subsystem layer to allow for registering
>  		 * new device and provide BCR/DCR/PID at the same time.
>  		 */
> -		ret = i3c_master_add_i3c_dev_locked(&hci->master, next_addr);
> -		if (ret)
> -			break;
> +		i3c_master_add_i3c_dev_locked(&hci->master, next_addr);
>  	}
>
>  	hci_free_xfer(xfer, 2);
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
